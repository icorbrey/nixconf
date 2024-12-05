{ config, utils, ... }:
  utils.mkBrowserExtension config "ynab-toolkit" {
    firefox = {
      id = "{4F1FB113-D7D8-40AE-A5BA-9300EAEA0F51}";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/toolkit-for-ynab/latest.xpi";
    };
  }
