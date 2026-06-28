{ pkgs, ... }:
{
  imports = [
    ../common.nix

    ../modules/desktop/gnomeadwaita/desktop.nix

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

  # services.flatpak.remotes = [
  #   {
  #     name = "flathub-beta";
  #     location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
  #   }
  # ];

  home.packages = with pkgs; [
    # programming
    vscode
    qtcreator

    # personal
    obsidian
    planify
    calibre
    zotero

    # browsers
    google-chrome

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

    # tools
    pdfarranger
    evince
    gnome-disk-utility
    mission-center

    # piracy
    ani-cli

    # torrents
    qbittorrent

    # gaming
    protonup-qt
    mangohud
    itch

    # basics
    haruna
    mpv
    imv
    ffmpeg
    libreoffice-fresh

    # system
    easyeffects

    # virtualization
    bottles
  ];

  services.flatpak.packages = [
    # gaming
    "com.heroicgameslauncher.hgl"
    "net.lutris.Lutris"
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

    # reader
    "com.github.johnfactotum.Foliate"
  ];
}
