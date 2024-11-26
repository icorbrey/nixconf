{ ... }:
{
  programs.eza = {
    enable = true;
  };
  
  programs.bash.shellAliases = {
    ls = "eza";
    ll = "eza -l";
    la = "eza -a";
    t = "eza --tree --group-directories-last";
    tree = "eza --tree -- group-directories-last";
  };
}
