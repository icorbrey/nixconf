{ config, utils, ... }:
  utils.mkBrowserExtension config "github-refined" {
    firefox = {
      id = "{a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad}";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/refined-github-/latest.xpi";
    };
  }
