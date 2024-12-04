{ config, utils, ... }:
  utils.mkPackage config "helix" {
    programs.helix = {
      enable = true;

      settings = {
        theme = "catppuccin_mocha";
        editor = {
          smart-tab.enable = false;
          true-color = true;
        };
      };
    };
  }
