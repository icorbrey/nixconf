{ config, utils, ... }:
  utils.mkBrowserExtension config "youtube-hide-shorts" {
    firefox = {
      id = "{88ebde3a-4581-4c6b-8019-2a05a9e3e938}";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/hide-youtube-shorts/latest.xpi";
    };
  }
