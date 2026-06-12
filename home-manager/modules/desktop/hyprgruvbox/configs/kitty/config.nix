{ ... }: {
  my.apps.kitty = true;

  xdg.configFile."kitty/kitty.conf".source = ../../../../../../dotfiles/kitty/hyprgruvbox/kitty.conf;
}
