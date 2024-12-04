{ config, utils, ... }: let
  shellAliases = {
    cat = "bat";
  };
in utils.mkPackage config "bat" {
  programs = {
    bat.enable = true;

    bash = utils.mkIfPackageEnabled config "bash" {
      inherit shellAliases;
    };
  };
}
