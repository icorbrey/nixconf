{ config, pkgs, utils, ... }:
  utils.mkLanguage config "toml" {
    home.packages = [
      pkgs.taplo
    ];
  }
