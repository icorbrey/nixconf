{ pkgs }:
{
  default = pkgs.mkShell {
    nativeBuildInputs = with pkgs; [
      git
      home-manager
      just
      nix
    ];
  };
}
