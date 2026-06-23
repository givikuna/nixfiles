{ pkgs, ... }:
{
  imports = [
    ../common.nix

    ../modules/desktop/hyprgruvbox/desktop.nix

    # apps:
    ../packages/applications/dolphin/package.nix
    ../packages/applications/firefox/package.nix
    ../packages/applications/helix/package.nix
    ../packages/applications/micro/package.nix
    ../packages/applications/neovim/package.nix
    ../packages/applications/prismlauncher/package.nix
    ../packages/applications/gonwatch/package.nix
    ../packages/applications/tuxedo/package.nix
    ../packages/applications/thunderbird/package.nix
    ../packages/applications/chronicler/package.nix
    ../packages/applications/nixcord/package.nix
    ../packages/applications/kitty/package.nix
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
