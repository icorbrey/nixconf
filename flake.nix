{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, home-manager, nixpkgs, ... } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    devices = devices: let
      forAllDevices = fn: builtins.mapAttrs
        (hostname: modules:
          (fn {
            inherit hostname;
            inherit modules;
          }))
          devices;
          
      getOptionalPath = path: nixpkgs.lib.optional
        (builtins.pathExists path)
        path;
    in {
      devShells.${system} = import ./shell.nix {
        inherit pkgs;
      };
      
      nixosConfigurations = forAllDevices ({ hostname, ... }: 
        nixpkgs.lib.nixosSystem {
          modules = [{ networking.hostName = hostname; }]
            ++ getOptionalPath ./systems/${hostname}.nix;
        });

      homeConfigurations = forAllDevices ({ modules, ... }:
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          inherit modules;
        });
    };
  in devices {
    zephyr = [
      ./modules/common.nix
    ];

    NB-99KZST3 = [
      ./modules/common.nix
    ];
  };

  nixConfig = {
    warn-dirty = false;
  };
}
