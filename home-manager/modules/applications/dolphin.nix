{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kdePackages.dolphin

    # dependencies for dolphin

    # icon support
    kdePackages.qtsvg

    # KIO-Fuse
    kdePackages.kio
    kdePackages.kio-fuse
    kdePackages.kio-extras
  ];
}
