{ config, pkgs, ... }:
{
  imports = [
    ../programs/bash.nix
    ../programs/eza.nix
    ../programs/git.nix
    ../programs/helix.nix
    ../programs/starship.nix
  ];

  home.homeDirectory = "/home/icorbrey";
  home.username = "icorbrey";

  home.packages = with pkgs; [
    home-manager
    just
    markdown-oxide
    nil
    taplo
    vscode-langservers-extracted
    yaml-language-server
  ];
  
  home.stateVersion = "24.11";
}
