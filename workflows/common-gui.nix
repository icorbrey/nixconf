{ config, utils, ... }:
  utils.mkWorkflow config "common-gui" {
    packages = {
      discord.enable = true;
      firefox.enable = true;
      obsidian.enable = true;
      vlc.enable = true;
    };
  }
