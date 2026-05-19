{ pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox
    discord
    obsidian
    spotify

    gimp

    haruna
    mpv
    imv

    protonup-qt
    mangohud
    easyeffects

    qbittorrent
  ];
}
