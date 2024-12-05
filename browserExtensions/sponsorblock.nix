{ config, utils, ... }:
  utils.mkBrowserExtension config "sponsorblock" {
    firefox = {
      shortId = "sponsorblock";
      uuid = "sponsorBlocker@ajay.app";
    };
  }
