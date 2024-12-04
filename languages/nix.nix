{ config, pkgs, utils, ... }:
  utils.mkLanguage config "nix" {
    home.packages = [
      pkgs.nil
    ];
  }
