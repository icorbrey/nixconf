{ config, pkgs, utils, ... }:
  utils.mkFont config "fira-code" {
    home.packages = [
      pkgs.fira-code
    ];
  }
