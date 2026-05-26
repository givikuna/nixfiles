{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum

    gruvbox-kvantum
  ];

  home.sessionVariables = {
    QT_STYLE_OVERRIDE = "kvantum";
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.kdePackages.breeze;
    name = "breeze_cursors";
    size = 24;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Gruvbox-Dark-B";
      package = pkgs.gruvbox-gtk-theme;
    };
    iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = pkgs.gruvbox-plus-icons;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;

      # cursor:
      gtk-cursor-aspect-ratio = "1.0";
      gtk-cursor-color = "#fabd2f";
      gtk-cursor-blink = false;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      cursor-theme = "breeze_cursors";
      gtk-theme = "Gruvbox-Dark-B";
      icon-theme = "Gruvbox-Plus-Dark";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  xdg.configFile."Kvantum/kvantum.kvconfig".source = ../../dotfiles/Kvantum/kvantum.kvconfig;

  xdg.configFile."Kvantum/Gruvbox-Dark-Brown/Gruvbox-Dark-Brown.kvconfig" = {
    source = "${pkgs.gruvbox-kvantum}/share/Kvantum/Gruvbox-Dark-Brown/Gruvbox-Dark-Brown.kvconfig";
  };
  xdg.configFile."Kvantum/Gruvbox-Dark-Brown/Gruvbox-Dark-Brown.svg" = {
    source = "${pkgs.gruvbox-kvantum}/share/Kvantum/Gruvbox-Dark-Brown/Gruvbox-Dark-Brown.svg";
  };
}
