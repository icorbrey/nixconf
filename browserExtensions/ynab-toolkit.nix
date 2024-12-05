{ config, utils, ... }:
  utils.mkBrowserExtension config "ynab-toolkit" {
    firefox = {
      shortId = "toolkit-for-ynab";
      uuid = "{4F1FB113-D7D8-40AE-A5BA-9300EAEA0F51}";
    };
  }
