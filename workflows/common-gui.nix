{ pkgs, ... }:
{
  home.packages = with pkgs; [
    discord
    firefox
    obsidian
    vlc
  ];
}
