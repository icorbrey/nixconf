{
  inputs = {
    # dmux <https://github.com/zdcthomas/dmux>
    dmux.url = "github:zdcthomas/dmux";
    dmux.inputs.nixpkgs.follows = "nixpkgs";

    # Home Manager <https://github.com/nix-community/home-manager>
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    # Nix packages <https://github.com/NixOS/nixpkgs>
    nixpkgs.url = "github:NixOS/nixpkgs";

    # Nix User Repository <https://github.com/nix-community/NUR>
    nur.url = "github:nix-community/NUR";
  };

  outputs = { home-manager, nixpkgs, ... } @ inputs: let
    system = "x86_64-linux";

    overlays = import ./overlays {
      inherit inputs;
    };

    pkgs = import nixpkgs {
      inherit overlays;
      inherit system;

      config.allowUnfree = true;
    };

    utils = rec {
      type = {
        browserExtension = "browserExtensions";
        font = "fonts";
        language = "languages";
        package = "packages";
        workflow = "workflows";
      };
      
      mkModule = config: type: name: obj: {
        options.${type}.${name}.enable = nixpkgs.lib.mkEnableOption name;
        config = mkIfEnabled config type name obj;
      };

      mkLanguage = config: mkModule config type.language;
      mkPackage = config: mkModule config type.package;
      mkWorkflow = config: mkModule config type.workflow;
      mkFont = config: mkModule config type.font;

      mkBrowserExtension = config: name: obj: mkModule config type.browserExtension name {
        programs.firefox.policies.ExtensionSettings.${obj.firefox.uuid} = {
          install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${obj.firefox.shortId}/latest.xpi";
          installation_mode = "normal_installed";
        };
      };

      mkIfEnabled = config: type: name: nixpkgs.lib.mkIf config.${type}.${name}.enable;

      mkIfBrowserExtensionEnabled = config: mkIfEnabled config type.browserExtension;
      mkIfFontEnabled = config: mkIfEnabled config type.font;
      mkIfLanguageEnabled = config: mkIfEnabled config type.language;
      mkIfPackageEnabled = config: mkIfEnabled config type.package;
      mkIfWorkflowEnabled = config: mkIfEnabled config type.workflow;
    };

    forEachDevice = fn: devices:
      builtins.listToAttrs (builtins.map
        (name: {
          inherit name;
          value = (fn name);
        })
        devices);

    devices = devices: {
      devShells.${system} = import ./shell.nix {
        inherit pkgs;
      };

      nixosConfigurations = forEachDevice
        (hostname: nixpkgs.lib.nixosSystem {
          modules = [];
        })
        devices;

      homeConfigurations = forEachDevice
        (hostname: home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [./systems/${hostname}/home.nix];
          extraSpecialArgs = {
            inherit inputs utils;
          };
        })
        devices;
    };
  in devices [
    "elysium"
    "NB-99KZST3"
    "zephyr"
  ];

  nixConfig = {
    warn-dirty = false;
  };
}
