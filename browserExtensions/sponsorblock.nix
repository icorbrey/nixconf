{ config, utils, ... }:
  utils.mkBrowserExtension config "sponsorblock" {
    firefox = {
      id = "sponsorBlocker@ajay.app";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
    };
  }
