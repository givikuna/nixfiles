{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.dolphin

    # dependencies for dolphin

    # icon support
    kdePackages.qtsvg
    kdePackages.breeze

    # KIO-Fuse
    kdePackages.kio
    kdePackages.kio-fuse
    kdePackages.kio-extras
  ];

  #xdg.desktopEntries."org.kde.dolphin" = {
  #  name = "Dolphin";
  #  genericName = "File Manager";
  #  exec = "env QT_STYLE_OVERRIDE=Breeze-Dark dolphin %u";
  #  icon = "system-file-manager";
  #  terminal = false;
  #  categories = [
  #    "System"
  #    "FileTools"
  #    "FileManager"
  #  ];
  #  mimeType = [ "inode/directory" ];
  #};
}
