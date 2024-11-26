{ pkgs, ... }:
{
  home.packages = with pkgs; [
    omnisharp-roslyn
  ];
}
