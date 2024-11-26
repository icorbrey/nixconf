{ pkgs, ... }:
{
  imports = [
    ../languages/astro.nix
  ];

  home.packages = with pkgs; [
    svelte-language-server
    typescript-language-server
    vscode-langservers-extracted
    vue-language-server
  ];
}
