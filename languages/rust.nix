{ config, pkgs, utils, ... }:
  utils.mkLanguage config "rust" {
    home.packages = [
      pkgs.bacon
      pkgs.cargo
      pkgs.rust-analyzer
      pkgs.rustc
    ];
  }
