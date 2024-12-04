{ config, pkgs, utils, ... }:
  utils.mkLanguage config "markdown" {
    home.packages = [
      pkgs.markdown-oxide
      pkgs.marksman
    ];
  }
