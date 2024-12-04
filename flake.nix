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

      mkIfEnabled = config: type: name: nixpkgs.lib.mkIf config.${type}.${name}.enable;

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
    "NB-99ZKST3"
    "zephyr"
  ];

  nixConfig = {
    warn-dirty = false;
  };
}
