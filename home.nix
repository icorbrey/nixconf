{ config, pkgs, ... }: {
  home.homeDirectory = "/home/icorbrey";
  home.username = "icorbrey";

  home.packages = with pkgs; [
    helix
  ];

  programs = {
    helix = import ../programs/helix.nix
  };

  home.stateVersion = "23.11";
}
