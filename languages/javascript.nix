{ config, pkgs, utils, ... }:
  utils.mkLanguage config "javascript" {
    home.packages = [
      pkgs.vscode-langservers-extracted
    ];
  }
