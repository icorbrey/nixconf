{ ... }:
{
  programs = {
    bat.enable = true;

    bash.shellAliases = {
      cat = "bat";
    };
  };
}
