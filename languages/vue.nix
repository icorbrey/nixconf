{ config, pkgs, utils, ... }:
  utils.mkLanguage config "vue" {
    home.packages = [
      pkgs.vue-language-server
    ];
  }
