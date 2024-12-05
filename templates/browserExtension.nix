{ config, utils, ... }:
  utils.mkBrowserExtension config "<<NAME>>" {
    firefox = {
      id = "";
      install_url = "";
    };
  }
