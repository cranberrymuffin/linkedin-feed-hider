# Chrome Web Store listing: Feed Hider for LinkedIn

Copy each section into the matching field in the Developer Dashboard.
Build with `./build.sh`, then upload `dist/feed-hider-for-linkedin-1.0.0.zip`.
For Firefox, see `FIREFOX_LISTING.md`.

## Store listing tab

**Name** (from manifest): Feed Hider for LinkedIn

**Summary** (from manifest, 98/132 chars):
Hides the LinkedIn home feed and takes you to Jobs instead. Stop scrolling and do something great.

**Description:**

LinkedIn is useful. The feed is where your time goes.

Feed Hider for LinkedIn removes the home feed entirely. When you open LinkedIn
or try to go to the feed, you're taken straight to Jobs. Everything else
still works: messaging, notifications, your network, profiles, job search,
and links to individual posts.

What it does:
• Hides the home feed and the news and puzzles sidebar
• Redirects linkedin.com and /feed to the Jobs page
• Removes the Home button from the top navigation
• Leaves links to individual posts working

No settings, no off switch, no "just five minutes." Installing it is the
decision.

Privacy: the extension collects no data, makes no network requests, and
requests no permissions. It runs only on linkedin.com.

Not affiliated with, endorsed by, or sponsored by LinkedIn Corporation.
LinkedIn is a trademark of LinkedIn Corporation.

**Category:** Productivity

**Language:** English

## Graphic assets

- **Store icon (128×128):** `icons/icon128.png`
- **Screenshots (1280×800 or 640×400, at least 1):** `store/screenshot-1.png` (mock-up with placeholder profile; source `store/screenshot-1.html`)
- **Small promo tile (440×280):** optional

## Privacy practices tab

**Single purpose:**
Hides the LinkedIn home feed and redirects it to the LinkedIn Jobs page, so
users can use LinkedIn without scrolling the feed.

**Permission justification:**
The extension requests no API permissions. Its content script runs only on
https://www.linkedin.com/* to hide the feed and redirect away from it.

(If the dashboard asks about host access:)
Host access to www.linkedin.com is required to hide the feed and redirect
from the feed page. The extension does not run on any other site.

**Are you using remote code?** No.

**Data usage:** Check none of the data categories. The extension does not
collect or transmit any user data.

Then check all three certifications:
- I do not sell or transfer user data to third parties, outside of the approved use cases
- I do not use or transfer user data for purposes that are unrelated to my item's single purpose
- I do not use or transfer user data to determine creditworthiness or for lending purposes

**Privacy policy URL:** Not required, because no user data is collected.

## Before submitting

1. Register as a Chrome Web Store developer (one-time US$5 fee):
   https://chrome.google.com/webstore/devconsole
2. Click "New item" and upload the zip.
3. Fill in the tabs above, add a screenshot, and submit for review.
   Reviews usually take a few days.
