{ config, pkgs, utils, ... }:
  utils.mkLanguage config "yaml" {
    home.packages = [
      pkgs.yaml-language-server
    ];
  }
