{ pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox
    google-chrome
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

    imagemagick
  ];
}
