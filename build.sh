#!/bin/sh
# Builds the store zips into dist/:
#   feed-hider-for-linkedin-<version>.zip          Chrome Web Store
#   feed-hider-for-linkedin-<version>-firefox.zip  addons.mozilla.org
# manifest.json stays Chrome-only (Chrome warns about Firefox keys); the
# Firefox build adds its add-on ID and data-collection declaration here.
set -eu
cd "$(dirname "$0")"

version=$(jq -r .version manifest.json)
files="content.js hide.css icons/icon16.png icons/icon32.png icons/icon48.png icons/icon128.png icons/LICENSE-noto-emoji icons/NOTICE"
chrome="dist/feed-hider-for-linkedin-$version.zip"
firefox="dist/feed-hider-for-linkedin-$version-firefox.zip"

mkdir -p dist
rm -f "$chrome" "$firefox"
zip -q -X "$chrome" manifest.json $files

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
for f in $files; do
  mkdir -p "$tmp/$(dirname "$f")"
  cp "$f" "$tmp/$f"
done
# data_collection_permissions needs Firefox 140+ (and :has() needs 121+).
jq '.browser_specific_settings = {
  gecko: {
    id: "feed-hider-for-linkedin@cranberrymuffin.github.io",
    strict_min_version: "140.0",
    data_collection_permissions: { required: ["none"] }
  }
}' manifest.json > "$tmp/manifest.json"
(cd "$tmp" && zip -q -X -r "$OLDPWD/$firefox" manifest.json $files)

echo "$chrome"
echo "$firefox"
