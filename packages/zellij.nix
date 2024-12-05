{ config, pkgs, utils, ... }: let
  shellAliases = {
    z = "zellij";
    za = "zellij attach";
    zls = "zellij list-sessions";
  };
in utils.mkPackage config "zellij" {
  home.packages = [
    pkgs.zellij
  ];

  programs.bash = utils.mkIfPackageEnabled config "bash" {
    inherit shellAliases;
  };
}
