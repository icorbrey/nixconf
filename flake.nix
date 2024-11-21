{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    configure = hostname: home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [./systems/${hostname}/home.nix];
    };
  in {
    homeConfigurations = {
      mneumosyne = configure "mneumosyne";
    };
  };
}
