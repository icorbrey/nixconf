{ config, utils, ... }:
  utils.mkBrowserExtension config "ublock-origin" {
    firefox = {
      shortId = "ublock-origin";
      uuid = "uBlock0@raymondhill.net";
    };
  }
