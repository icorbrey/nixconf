{ config, pkgs, ... }:
{
  home.homeDirectory = "/home/icorbrey";
  home.username = "icorbrey";

  home.packages = with pkgs; [
    git
    helix
    home-manager
    lazygit
    tree
  ];

  programs = {
    git = import ../config/git.nix;
    helix = import ../config/helix.nix;
    lazygit = import ../config/lazygit.nix;
  };

  home.stateVersion = "24.11";
}
