{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    escapeTime = 0;
    terminal = "tmux-256code";
    extraConfig = ''
      set -g base-index 1
      set -g pane-base-index 1
      set -g renumber-windows on
      set -g default-terminal "tmux-256color"
      set -ga terminal-overrides ",*:RGB"
      set -g set-clipboard on
      set -g status "on"
      set -g status-justify "left"
      set-option -g status-position top
      set -g status-interval 1
      set -g status-left-length 40
      set -g status-right-length 80

      unbind -n Left
      unbind -n Right
      unbind -n Up
      unbind -n Down
      unbind C-b
      unbind %
      unbind '"'
      unbind r

      set -g prefix M-b
      bind-key M-b send-prefix

      bind -n M-t new-window -c "#{pane_current_path}"
      bind -n M-w kill-pane
      bind -n M-q kill-window

      bind -n M-r split-window -h -c "#{pane_current_path}"
      bind -n M-f split-window -v -c "#{pane_current_path}"

      bind -n M-Left  select-pane -L
      bind -n M-Down  select-pane -D
      bind -n M-Up    select-pane -U
      bind -n M-Right select-pane -R

      bind -n M-1 select-window -t 1
      bind -n M-2 select-window -t 2
      bind -n M-3 select-window -t 3
      bind -n M-4 select-window -t 4
      bind -n M-5 select-window -t 5
      bind -n M-6 select-window -t 6
      bind -n M-7 select-window -t 7
      bind -n M-8 select-window -t 8
      bind -n M-9 select-window -t 9
    '';
  };
}
