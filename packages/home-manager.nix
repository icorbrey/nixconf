{ config, pkgs, utils, ... }:
  utils.mkPackage config "home-manager" {
    home.packages = [
      pkgs.home-manager
    ];
  }
