{ config, utils, ... }:
  utils.mkWorkflow config "common-gui" {
    packages = {
      discord.enable = true;
      firefox.enable = true;
      obsidian.enable = true;
      vlc.enable = true;
    };

    fonts = {
      fira-code.enable = true;
    };

    browserExtensions = {
      github-refined.enable = true;
      obsidian-web-clipper.enable = true;
      onepassword.enable = true;
      sponsorblock.enable = true;
      ublock-origin.enable = true;
      ynab-toolkit.enable = true;
      youtube-hide-shorts.enable = true;
      youtube-high-definition.enable = true;
    };
  }
