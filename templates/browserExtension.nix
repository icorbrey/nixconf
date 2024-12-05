{ config, utils, ... }:
  utils.mkBrowserExtension config "<<NAME>>" {
    firefox = {
      shortId = "";
      uuid = "";
    };
  }
