{ pkgs, ... }:
{
  imports = [
    ./applications/dolphin.nix
    ./applications/firefox.nix
    ./applications/mission-center.nix
    ./applications/kitty.nix
    ./applications/spotify.nix
  ];

  home.packages = with pkgs; [
    google-chrome

    discord

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

    thunar

    obs-studio
    ffmpeg
  ];
}
