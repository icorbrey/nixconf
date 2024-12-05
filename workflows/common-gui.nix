{ config, utils, ... }:
  utils.mkWorkflow config "common-gui" {
    packages = {
      discord.enable = true;
      firefox.enable = true;
      obsidian.enable = true;
      vlc.enable = true;
    };

    browserExtensions = {
      onepassword.enable = true;
      sponsorblock.enable = true;
      ublock-origin.enable = true;
      ynab-toolkit.enable = true;
      youtube-hide-shorts.enable = true;
      youtube-high-definition.enable = true;
    };
  }
