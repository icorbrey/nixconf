{ config, pkgs, ... }: {
  home.homeDirectory = "/home/icorbrey";
  home.username = "icorbrey";

  home.packages = with pkgs; [
    helix
    home-manager
    lazygit
    tree
  ];

  programs = {
    helix = import ../../programs/helix.nix;
    lazygit = import ../../programs/lazygit.nix;
  };

  home.stateVersion = "24.11";
}
