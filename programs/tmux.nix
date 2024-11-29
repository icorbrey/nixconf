{ ... }:
{
  programs.tmux = {
    enable = true;

    secureSocket = false;
    escapeTime = 0;
    baseIndex = 1;

    extraConfig = ''
      # Force proper color support
      # See: <https://old.reddit.com/r/tmux/comments/mesrci/tmux_2_doesnt_seem_to_use_256_colors>
      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"
      
      # Enable mouse support
      set-option -g mouse on

      # Easy-to-remember split pane commands
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
    '';
  };
}
