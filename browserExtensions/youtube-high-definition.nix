{ config, utils, ... }:
  utils.mkBrowserExtension config "youtube-high-definition" {
    firefox = {
      id = "{7b1bf0b6-a1b9-42b0-b75d-252036438bdc}";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/youtube-high-definition/latest.xpi";
    };
  }
