{ config, utils, ... }:
  utils.mkBrowserExtension config "onepassword" {
    firefox = {
      shortId = "1password-x-password-manager";
      uuid = "{d634138d-c276-4fc8-924b-40a0ea21d284}";
    };
  }
