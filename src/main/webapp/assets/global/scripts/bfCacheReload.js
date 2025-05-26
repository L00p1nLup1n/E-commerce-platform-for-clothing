// bfCacheReload.js
window.addEventListener("pageshow", function(event) {
  if (event.persisted) {
    // Prevent reload loop by checking a sessionStorage flag
    if (!sessionStorage.getItem("reloadedFromBFCache")) {
      sessionStorage.setItem("reloadedFromBFCache", "true");
      window.location.reload();
    } else {
      sessionStorage.removeItem("reloadedFromBFCache");
    }
  }
});