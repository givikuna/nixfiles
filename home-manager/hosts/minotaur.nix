{ pkgs, ... }:
{
  imports = [
    ../common.nix

    ../modules/desktop/hyprgruvbox/desktop.nix

    ../packages/configurations/applications/chronicler/package.nix
    ../packages/configurations/applications/dolphin/package.nix
    ../packages/configurations/applications/firefox/package.nix
    ../packages/configurations/applications/gonwatch/package.nix
    ../packages/configurations/applications/helix/package.nix
    ../packages/configurations/applications/kitty/package.nix
    ../packages/configurations/applications/micro/package.nix
    ../packages/configurations/applications/neovim/package.nix
    ../packages/configurations/applications/nixcord/package.nix
    ../packages/configurations/applications/prismlauncher/package.nix
    ../packages/configurations/applications/thunderbird/package.nix
  ];

  home.packages = with pkgs; [
    vscode
    qtcreator
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
