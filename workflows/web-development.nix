{ config, utils, ... }:
  utils.mkWorkflow config "web-development" {
    languages = {
      javascript.enable = true;
      svelte.enable = true;
      typescript.enable = true;
      # vue.enable = true;
    };
  }
