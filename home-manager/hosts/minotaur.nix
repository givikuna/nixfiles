{ pkgs, inputs, ... }:
{
  imports = [
    ../common.nix

    ../modules/desktop/hyprgruvbox/desktop.nix

    ########## packages

    # programming
    ../packages/configurations/applications/helix/package.nix
    ../packages/configurations/applications/micro/package.nix
    ../packages/configurations/applications/neovim/package.nix

    # personal
    ../packages/configurations/applications/chronicler/package.nix

    # browsers
    ../packages/configurations/applications/firefox/package.nix

    # file managers
    ../packages/configurations/applications/dolphin/package.nix

    # piracy
    ../packages/configurations/applications/gonwatch/package.nix

    # terminal emulators
    ../packages/configurations/applications/kitty/package.nix

    # communications
    ../packages/configurations/applications/nixcord/package.nix
    ../packages/configurations/applications/thunderbird/package.nix

    # gaming
    ../packages/configurations/applications/prismlauncher/package.nix
  ];

  home.packages = with pkgs; [
    # programming
    vscode
    qtcreator

    # personal
    planify
    skrooge
    kmymoney
    calibre
    zotero

    # browsers
    google-chrome
    chromium
    brave
    librewolf
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

    # capturing
    gimp
    imagemagick
    switcheroo
    obs-studio

    # streaming services
    spotify
    spotify-player

    # file managers
    thunar

    # privacy
    tor-browser

    # editing
    davinci-resolve

    # tools
    pdfarranger
    evince
    gnome-disk-utility
    mission-center
    caligula

    # piracy
    ani-cli

    # torrents
    qbittorrent

    # gaming
    protonup-qt
    mangohud
    itch
    lutris
    heroic

    # basics
    haruna
    mpv
    imv
    ffmpeg
    libreoffice-fresh
    sioyek

    # system
    easyeffects
    nwg-displays
    pwvucontrol
    pavucontrol
  ];

  services.flatpak.packages = [
    # gaming
    "ro.go.hmlendea.SokoGrump"
    "com.endlessnetwork.aqueducts"
    "sh.ppy.osu"
    "com.mojang.Minecraft"
    "org.vinegarhq.Sober"

    # communications
    "com.discordapp.Discord"

    # system
    "com.github.tchx84.Flatseal"

    # torrents
    "de.haeckerfelix.Fragments"

    # money mgmt
    # "com.actualbudget.actual"

    # personal
    "tech.dongdongbh.mindwtr"
    "md.obsidian.Obsidian"

    # reader
    "com.github.johnfactotum.Foliate"
  ];
}
