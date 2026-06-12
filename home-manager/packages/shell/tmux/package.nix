{ ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    terminal = "screen-256color";
    mouse = true;

    extraConfig = ''
      unbind C-b

      # ctrl + alt + arrow to move between windows
      bind-key -n C-M-Left select-window -t :-
      bind-key -n C-M-Right select-window -t :+

      # ctrl + arrow to focus between panes
      bind-key -n M-Left select-pane -L
      bind-key -n M-Right select-pane -R
      bind-key -n M-Up select-pane -U
      bind-key -n M-Down select-pane -D

      # alt m for new window
      # alt n for new pane
      bind-key -n M-n split-window -h
      bind-key -n M-m new-window

      # kill window if no panes
      bind-key -n M-r kill-pane

      # alt shift arrow to resize
      bind-key -n M-S-Left resize-pane -L 5
      bind-key -n M-S-Right resize-pane -R 5
      bind-key -n M-S-Up resize-pan -U 5
      bind-key -n M-S-Down resize-pane -D 5

      # ctrl shift al arrow to swap panes
      # bind-key -n C-S-M-Left swap-pane -L
      # bind-key -n C-S-M-Right swap-pane -R
      bind-key -n C-S-M-Up swap-pane -U
      bind-key -n C-S-M-Down swap-pane -D
    '';
  };
}
