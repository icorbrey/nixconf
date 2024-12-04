{ config, pkgs, utils, ... }:
  utils.mkPackage config "discord" {
    home.packages = [
      pkgs.discord
    ];
  }
