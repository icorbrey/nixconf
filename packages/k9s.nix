{ config, pkgs, utils, ... }:
  utils.mkPackage config "k9s" {
    home.packages = [
      pkgs.k9s
    ];
  }
