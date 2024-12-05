{ config, pkgs, utils, ... }:
  utils.mkPackage config "zellij" {
    home.packages = [
      pkgs.zellij
    ];
  }
