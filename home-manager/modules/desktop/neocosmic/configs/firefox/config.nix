{ ... }: {
  programs.firefox.profiles.default.settings = {
    "widget.gtk.libadwaita-colors.enabled" = false;
  };
}
