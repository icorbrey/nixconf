{ config, pkgs, utils, ... }:
  utils.mkPackage config "just" {
    home.packages = [
      pkgs.just
    ];
  }
