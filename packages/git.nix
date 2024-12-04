{ config, utils, ... }:
  utils.mkPackage config "git" {
    programs.git.enable = true;
  }
