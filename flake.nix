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

    devices = devices: let
      forAllDevices = fn: builtins.mapAttrs
        (hostname: modules:
          (fn {
            inherit hostname;
            inherit modules;
          }))
          devices;
    in {
      devShells.${system} = import ./shell.nix {
        inherit pkgs;
      };
      
      nixosConfigurations = forAllDevices ({ hostname, ... }: 
        nixpkgs.lib.nixosSystem {
          modules = [
            ({ ... }: {
              nixpkgs.overlays = overlays;
            })
          ];
        });

      homeConfigurations = forAllDevices ({ modules, ... }:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          inherit modules;

          extraSpecialArgs = {
            inherit inputs;
          };
        });
    };
  in devices {
    zephyr = [
      ./workflows/common.nix
      ./workflows/common-gui.nix
      ./workflows/rust.nix
      ./workflows/web-development.nix
    ];

    NB-99KZST3 = [
      ./workflows/c-sharp.nix
      ./workflows/common.nix
      ./workflows/containers.nix
      ./workflows/rust.nix
      ./workflows/web-development.nix
    ];
  };

  nixConfig = {
    warn-dirty = false;
  };
}
