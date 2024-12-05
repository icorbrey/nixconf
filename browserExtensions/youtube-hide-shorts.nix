{ config, utils, ... }:
  utils.mkBrowserExtension config "youtube-hide-shorts" {
    firefox = {
      shortId = "hide-youtube-shorts";
      uuid = "{88ebde3a-4581-4c6b-8019-2a05a9e3e938}";
    };
  }
