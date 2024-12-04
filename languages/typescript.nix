{ config, pkgs, utils, ... }:
  utils.mkLanguage config "typescript" {
    home.packages = [
      pkgs.typescript-language-server
    ];
  }
