{ config, pkgs, ... }:
{
  imports = [
    ../programs/git.nix
    ../programs/helix.nix
    ../programs/lazygit.nix
  ];

  home.homeDirectory = "/home/icorbrey";
  home.username = "icorbrey";

  home.packages = with pkgs; [
    git
    helix
    home-manager
    lazygit
    tree
  ];

  home.stateVersion = "24.11";
}
