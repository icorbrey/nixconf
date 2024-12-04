{ config, pkgs, utils, ... }:
  utils.mkLanguage config "c-sharp" {
    home.packages = [
      pkgs.omnisharp-roslyn
    ];
  }
