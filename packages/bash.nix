{ config, utils, ... }:
  utils.mkPackage config "bash" {
    programs.bash = {
      enable = true;

      historyControl = ["ignoredups"];
      historyFileSize = 1000000;
      historySize = 1000000;

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
        shopt -s globstar

        # Use colors!
        case "$TERM" in
          xterm-color|*-256color) color_prompt=yes;;
        esac
      '';
    };
  }
