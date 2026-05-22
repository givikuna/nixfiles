{ pkgs, ... }:
{
  imports = [
    ./applications/dolphin.nix
    ./applications/firefox.nix
  ];

  home.packages = with pkgs; [
    discord
    spotify

    obsidian
    planify

    gimp
    imagemagick
    switcheroo

    haruna
    mpv
    imv

    protonup-qt
    mangohud
    easyeffects

    qbittorrent

    pdfarranger
    evince

    gnome-disk-utility
    mission-center

    thunar

    obs-studio
  ];
}
