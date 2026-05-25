{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.dolphin

    # theme:
    kdePackages.breeze-gtk
    kdePackages.breeze-icons
    gruvbox-plus-icons

    # dependencies for dolphin

    # icon support
    kdePackages.qtsvg
    kdePackages.breeze

    # KIO-Fuse
    kdePackages.kio
    kdePackages.kio-fuse
    kdePackages.kio-extras
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "kvantum";
    QT_STYLE_OVERRIDE = "kvantum";
  };

  xdg.configFile."dolphinrc" = {
    source = ../../../dotfiles/dolphin/dolphinrc;
    force = true;
  };

  xdg.desktopEntries.dolphin = {
    name = "Dolphin";
    exec = "env QT_STYLE_OVERRIDE=kvantum QT_QPA_PLATFORMTHEME=kvantum dolphin %u";
    icon = "system-file-manager";
    terminal = false;
    categories = [
      "System"
      "FileTools"
      "FileManager"
    ];
    mimeType = [ "inode/directory" ];
  };
}
