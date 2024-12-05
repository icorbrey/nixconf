{ config, utils, ... }:
  utils.mkBrowserExtension config "onepassword" {
    firefox = {
      id = "{d634138d-c276-4fc8-924b-40a0ea21d284}";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/1password-x-password-manager/latest.xpi";
    };
  }
