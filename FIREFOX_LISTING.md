# Firefox Add-ons listing: Feed Hider for LinkedIn

Build with `./build.sh`, then upload
`dist/feed-hider-for-linkedin-1.0.0-firefox.zip` at
https://addons.mozilla.org/developers/addon/submit/

Name, summary, description, category and screenshot are the same as the
Chrome listing (see `STORE_LISTING.md`).

## Submission steps

1. Sign in to addons.mozilla.org with a Firefox account (free).
2. Choose **On this site** (listed on addons.mozilla.org).
3. Upload the zip. Under compatible platforms, check **Firefox** only. Firefox
   for Android isn't tested: LinkedIn's mobile web layout is different.
4. **Do you need to submit source code?** No. Nothing is minified or
   generated; the zip contains the source as written.
5. Fill in the listing fields from `STORE_LISTING.md`.
6. **License:** pick one (e.g. MIT). The bundled icon is from Noto Emoji under
   the Apache License 2.0 (`icons/LICENSE-noto-emoji`, `icons/NOTICE`).
7. **Privacy policy:** not required. The manifest declares that no data is
   collected (`data_collection_permissions: none`).
8. **Notes to reviewer:**
   > No permissions or network requests. A content script on
   > www.linkedin.com hides the home feed with CSS and redirects / and /feed
   > to /jobs/. Testing requires a LinkedIn account; signed out, / redirects
   > to the public Jobs page.

Automated review usually passes within minutes; a human review may follow.

## Testing locally

Open `about:debugging#/runtime/this-firefox`, click **Load Temporary
Add-on…**, and pick `manifest.json` inside the unzipped Firefox build (not the
repo's `manifest.json`, which lacks the Firefox add-on ID). Temporary add-ons
are removed when Firefox quits.
