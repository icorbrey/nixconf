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
      DisableFirefoxScreenshots = true;
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

      Preferences = {
        "browser.contentblocking.category" = lock "strict";
        "browser.newtabpage.activity-stream.feeds.section.topsites" = lock false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = lock false;
        "browser.newtabpage.activity-stream.showWeather" = lock false;
        "browser.newtabpage.activity-stream.showSponsored" = lock false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock false;
        "browser.newtabpage.activity-stream.system.showSponsored" = lock false;
        "browser.topsites.contile.enabled" = lock false;
        "extensions.pocket.enabled" = lock false;
        "extensions.screenshots.disabled" = lock true;
      };
    };
  };
}
