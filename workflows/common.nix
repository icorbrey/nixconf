{ config, utils, ... }:
  utils.mkWorkflow config "common" {
    languages = {
      markdown.enable = true;
      nix.enable = true;
      toml.enable = true;
      yaml.enable = true;
    };

    packages = {
      bash.enable = true;
      bat.enable = true;
      dmux.enable = true;
      eza.enable = true;
      git.enable = true;
      helix.enable = true;
      home-manager.enable = true;
      just.enable = true;
      starship.enable = true;
      tmux.enable = true;
    };
  }
