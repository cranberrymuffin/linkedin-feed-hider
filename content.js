// Hides the LinkedIn feed and sends you to Jobs instead.
const JOBS_URL = "/jobs/";
let leaving = false;
let lastPath = location.pathname;

// Only the home feed itself, not /feed/update/... (links to individual posts).
function isFeedPath(path) {
  return path === "/" || /^\/feed\/?$/.test(path);
}

function apply() {
  const onFeed = isFeedPath(location.pathname);
  // Hide first: the redirect is a full page load, and hide.css shows the
  // message in place of the feed until Jobs arrives.
  document.documentElement.classList.toggle("lfh-on", onFeed);
  if (onFeed && !leaving) {
    leaving = true;
    location.replace(JOBS_URL);
  }
}

function checkPath() {
  if (location.pathname !== lastPath) {
    lastPath = location.pathname;
    apply();
  }
}

apply();

// LinkedIn is a single-page app (the Home tab is a <button> that routes in JS),
// so watch for client-side navigation. The feed only appears through DOM
// mutations, and MutationObserver callbacks run before the browser paints, so
// checking the path there hides the feed before it's ever drawn. The callback
// only reads the path and toggles a class on <html>, so it can't feed itself.
new MutationObserver(checkPath).observe(document, { childList: true, subtree: true });
if (window.navigation) {
  navigation.addEventListener("currententrychange", checkPath);
}
setInterval(checkPath, 500);
