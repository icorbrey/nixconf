{ config, utils, ... }: let 
  shellAliases = {
    lg = "lazygit";
  };
in utils.mkPackage config "lazygit" {
  programs = {
    lazygit.enable = true;

    bash = utils.mkIfPackageEnabled config "bash" {
      inherit shellAliases;
    };
  };
}
