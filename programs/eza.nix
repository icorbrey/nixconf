{ ... }:
{
  programs.eza = {
    enable = true;
  };
  
  programs.bash.shellAliases = {
    ls = "eza";
    ll = "eza -l";
    la = "eza -a";
  };
}
