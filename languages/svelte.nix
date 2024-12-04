{ config, pkgs, utils, ... }:
  utils.mkLanguage config "svelte" {
    home.packages = [
      pkgs.svelte-language-server
    ];
  }
