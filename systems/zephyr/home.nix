{ ... }:
{
  imports = [
    ../../languages
    ../../packages
    ../../workflows
  ];
  
  home.homeDirectory = "/home/icorbrey";
  home.username = "icorbrey";
  home.stateVersion = "24.11";

  workflows = {
    common.enable = true;
    common-gui.enable = true;
    web-development.enable = true;
  };

  languages = {
    rust.enable = true;
  };
}
