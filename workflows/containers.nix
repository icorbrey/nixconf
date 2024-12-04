{ config, utils, ... }:
  utils.mkWorkflow config "containers" {
    languages = {
      docker-compose.enable = true;
      dockerfile.enable = true;
    };

    packages = {
      k9s.enable = true;
    };
  }
