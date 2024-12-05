{ config, utils, ... }:
  utils.mkBrowserExtension config "obsidian-web-clipper" {
    firefox = {
      shortId = "web-clipper-obsidian";
      uuid = "clipper@obsidian.md";
    };
  }
