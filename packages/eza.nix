{ config, utils,  ... }: let
  shellAliases = {
    ls = "eza";
    ll = "eza -l";
    la = "eza -a";
    t = "eza --tree --group-directories-last";
    tree = "eza --tree -- group-directories-last";
  };
in utils.mkPackage config "eza" {
  programs = {
    eza.enable = true;

    bash = utils.mkIfPackageEnabled config "bash" {
      inherit shellAliases;
    };
  };
}
