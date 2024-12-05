{ config, utils, ... }:
  utils.mkBrowserExtension config "obsidian-web-clipper" {
    firefox = {
      id = "clipper@obsidian.md";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/web-clipper-obsidian/latest.xpi";
    };
  }
