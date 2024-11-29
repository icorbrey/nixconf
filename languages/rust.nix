{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bacon
    cargo
    rust-analyzer
    rustc
  ];
}
