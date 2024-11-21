{ config, pkgs, ... }: {
  home.homeDirectory = "/home/icorbrey";
  home.username = "icorbrey";

  home.packages = with pkgs; [];

  home.stateVersion = "23.11";
}
