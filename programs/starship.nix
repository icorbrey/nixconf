{ ... }:
{
  programs.starship = {
    enable = true;

    settings = {
      cmd_duration.disabled = true;
      directory.style = "bold blue";
      username.show_always = true;
    };
  };
}
