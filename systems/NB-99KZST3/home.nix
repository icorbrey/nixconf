{ ... }:
{
  imports = [
    ../../browserExtensions
    ../../languages
    ../../packages
    ../../workflows
  ];

  home.homeDirectory = "/home/icorbrey";
  home.username = "icorbrey";
  home.stateVersion = "24.11";

  workflows = {
    common.enable = true;
    containers.enable = true;
    web-development.enable = true;
  };

  languages = {
    c-sharp.enable = true;
    rust.enable = true;
  };

  packages = {};

  browserExtensions = {};
}
