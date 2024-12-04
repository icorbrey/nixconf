{ config, pkgs, utils, ... }:
  utils.mkPackage config "obsidian" {
    home.packages = [
      pkgs.obsidian
    ];
  }
