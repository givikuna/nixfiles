{ pkgs, ... }:
{
  imports = [
    ../common.nix

    ../modules/desktop/hyprgruvbox/desktop.nix

    ../modules/apps.nix
  ];

  home.packages = with pkgs; [
    google-chrome
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
    mission-center
    spotify
    spotify-player
    davinci-resolve
    ani-cli
    libreoffice-fresh
    bottles
    itch
    skrooge
  ];

  services.flatpak.packages = [
    "com.heroicgameslauncher.hgl"
    "net.lutris.Lutris"
    "ro.go.hmlendea.SokoGrump"
    "com.endlessnetwork.aqueducts"
    "sh.ppy.osu"
    "com.mojang.Minecraft"
    "com.discordapp.Discord"
    "org.vinegarhq.Sober"
    "com.github.tchx84.Flatseal"
    "de.haeckerfelix.Fragments"
  ];
}
