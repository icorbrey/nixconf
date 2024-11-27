{ pkgs, ... }:
{
  home.packages = with pkgs; [
    markdown-oxide
    marksman
  ];
}
