{ config, utils, ... }: let
  lock = Value: {
    inherit Value;
    status = "locked";
  };
in utils.mkPackage config "firefox" {
  programs.firefox = {
    enable = true;
    languagePacks = ["en-US"];

    policies = {
      DisableFirefixScreenshots = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;

      EnableTrackingProtection = {
        Cryptomining = true;
        Fingerprinting = true;
        Locked = true;
        Value = true;
      };

      DisplayBookmarksToolbar = "newtab";
      DisplayMenuBar = "default-off";
      ExtensionSettings."*".installation_mode = "blocked";
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      SearchBar = "unified";
    };
  };
}
