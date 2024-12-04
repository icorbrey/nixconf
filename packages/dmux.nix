{ config, pkgs, utils, ... }:
  utils.mkPackage config "dmux" {
    home.packages = [
      pkgs.dmux
    ];
  }
