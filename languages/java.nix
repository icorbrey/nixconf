{ config, pkgs, utils, ... }:
  utils.mkLanguage config "java" {
    home.packages = [
      pkgs.jdt-language-server
    ];
  }
