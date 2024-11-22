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

    devices = devices: {
      nixosConfigurations = builtins.mapAttrs
        (hostname: _: nixpkgs.lib.nixosSystem {
          modules = [{ networking.hostName = hostname; }];
        })
        devices;
      homeConfigurations = builtins.mapAttrs
        (_: modules: home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          inherit modules;
        })
        devices;
    };
  in devices {
    zephyr = [
      ./home/common.nix
    ];

    NB-99KZST3 = [
      ./home/common.nix
    ];
  };
}
