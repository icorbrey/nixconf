{ ... }:
{
  programs.bash = {
    enable = true;

    historyControl = ["ignoredups"];
    historyFileSize = 1000000;
    historySize = 1000000;

    shellAliases = {
      ls = "ls --color=auto";
      ll = "ls -alF";
      la = "ls -A";
      l = "ls -CF";
    };

    initExtra = ''
      # If not running interactively, don't do anything
      case $- in
        *i*) ;;
          *) return;;
      esac

      # Append to the history file, don't overwrite it
      shopt -s histappend

      # Update the window size after each command
      shopt -s checkwinsize

      # Allow double star globs
      shipt -s globstar

      # Use colors!
      case "$TERM" in
        xterm-color|*-256color) color_prompt=yes;;
      esac
    '';
  };
}
