{ config, pkgs, ... }:
{
  imports = [
    ../programs/bash.nix
    ../programs/git.nix
    ../programs/helix.nix
  ];

  home.homeDirectory = "/home/icorbrey";
  home.username = "icorbrey";

  home.packages = with pkgs; [
    bash
    git
    helix
    home-manager
    lazygit
    tree
  ];
  
  home.stateVersion = "24.11";
}
