{ config, utils, ... }:
  utils.mkBrowserExtension config "youtube-high-definition" {
    firefox = {
      shortId = "youtube-high-definition";
      uuid = "{7b1bf0b6-a1b9-42b0-b75d-252036438bdc}";
    };
  }
