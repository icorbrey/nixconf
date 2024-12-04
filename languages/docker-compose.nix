{ config, pkgs, utils, ... }:
  utils.mkLanguage config "docker-compose" {
    home.packages = [
      pkgs.docker-compose-language-server
    ];
  }
