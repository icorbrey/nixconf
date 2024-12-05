{ config, utils, ... }:
  utils.mkBrowserExtension config "github-refined" {
    firefox = {
      shortId = "refined-github-";
      uuid = "{a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad}";
    };
  }
