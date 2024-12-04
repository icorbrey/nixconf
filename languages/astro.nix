{ config, pkgs, utils, ... }: 
  utils.mkLanguage config "astro" {
    home.packages = [
      pkgs.astro-language-server
    ];

    programs.helix = utils.mkIfPackageEnabled config "helix" {
      languages.language = [{
        name = "astro";
        scope = "source.astro";
        injection-regex = "astro";
        file-types = ["astro"];
        roots = [
          "package.json"
          "astro.config.mjs"
        ];
        language-servers = ["astro-ls"];
        auto-format = true;
      }];
    };
  }
