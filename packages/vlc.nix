{ config, pkgs, utils, ... }:
  utils.mkPackage config "vlc" {
    home.packages = [
      pkgs.vlc
    ];
  }
