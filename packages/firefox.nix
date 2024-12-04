{ config, pkgs, utils, ... }:
  utils.mkPackage config "firefox" {
    home.packages = [
      pkgs.firefox
    ];
  }
