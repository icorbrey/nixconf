{ pkgs, ... }:
{
  imports = [
    ../languages/markdown.nix
    ../languages/nix.nix
    ../languages/toml.nix
    ../languages/yaml.nix
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
    nom
    vscode-langservers-extracted
  ];
  
  home.stateVersion = "24.11";
}
