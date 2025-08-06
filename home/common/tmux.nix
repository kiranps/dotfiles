{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    terminal = "screen-256color";

    extraConfig = ''
      bind | split-window -h -c '#{pane_current_path}'
      bind - split-window -v -c '#{pane_current_path}'

      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      set-option -g status-interval 5
      set-option -g automatic-rename on
      set-option -g automatic-rename-format '#{b:pane_current_path}'

      set-option -sg escape-time 10
      set-option -sa terminal-overrides ',alacritty:RGB'

      set -g pane-border-style fg='colour236'
      set -g pane-active-border-style bg=default,fg='colour236'
      set -g pane-active-border-style "bg=default fg=colour239"

      set -g status 'on'
      set -g status-justify 'left'
      set -g status-left-length '100'
      set -g status-right-length '100'
      set -g status-fg 'colour237'
      set -g status-bg 'colour236'
      set -g status-left "#[fg=colour238,bg=colour245,bold] ❐ #S #[bg=colour239] #[bg=colour236] "
      set -g status-right "#[fg=colour245,bg=colour238] %y-%m-%d #[fg=colour245,bg=colour237] %I:%M %p  #[fg=colour245,bg=colour238] #h "

      setw -g window-status-separator " "
      setw -g window-status-format '#[fg=colour235,bg=colour243] #I #[fg=colour245,bg=colour238] #W '
      setw -g window-status-current-format '#[fg=colour246,bg=colour238] #I #[fg=colour235,bg=colour244] #W '

      set-option -g update-environment "DIRENV_DIFF DIRENV_DIR DIRENV_WATCHES"
      set-environment -gu DIRENV_DIFF
      set-environment -gu DIRENV_DIR
      set-environment -gu DIRENV_WATCHES
      set-environment -gu DIRENV_LAYOUT
    '';
  };
}
