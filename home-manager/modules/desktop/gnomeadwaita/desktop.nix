{ pkgs, ... }: {
  home.packages = with pkgs; [
    gnome.gnome-terminal
    gnome.nautilus
    gnome.gnome-tweaks

    # catppuccin-gtk
    # papirus-icon-theme
  ];

  gtk = {
    enable = true;
    # theme = {
    #   name = "Catppuccin-Macchiato-Standard-Blue-Dark";
    #   package = pkgs.catppuccin-gtk;
    # };
    # iconTheme = {
    #   name = "Papirus-Dark";
    #   package = pkgs.papirus-icon-theme;
    # };
    cursorTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      size = 24;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-cursor-blink = false;
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        accent-color = "blue";
        color-scheme = "prefer-light";
      };

      "org/gnome/shell" = {
        enabled-extensions = [
          "blur-my-shell@aunetx"
        ];
        favorite-apps = [
          "org.gnome.Nautilus.desktop"
          "org.gnome.Terminal.desktop"
          "firefox.desktop"
          "org.gnome.Settings.desktop"
        ];
      };

      # "org/gnome/shell/extensions/user-theme" = {
      #   name = "Catppuccin-Macchiato-Standard-Blue-Dark";
      # };

      "org/gnome/shell/extensions/dash-to-dock" = {
        dock-position = "BOTTOM";
        extend-height = false;
        show-trash = false;
        show-mounts = false;
        show-apps-at-top = true;
        custom-theme-shrink = true;
      };

      "org/gnome/settings-daemon/plugins/color" = {
        night-light-enabled = true;
        night-light-temperature = 4700;
      };

      "org/gnome/desktop/input-sources" = {
        xkb-options = [ "ctrl:nocaps" ];
      };
    };
  };
}
