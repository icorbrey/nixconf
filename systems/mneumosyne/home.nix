{ config, pkgs, ... }: {
  home.homeDirectory = "/home/icorbrey";
  home.username = "icorbrey";

  home.packages = with pkgs; [
    helix
    lazygit
    tree
  ];

  programs = {
    helix = import ../../programs/helix.nix;
    lazygit = import ../../programs/lazygit.nix;
    tree = import ../../programs/tree.nix;
  };

  home.stateVersion = "23.11";
}
