# home-manager/modules/apps.nix
{
  pkgs,
  config,
  lib,
  ...
}:

let
  module-requiring-apps = [
    "discord"
    "dolphin"
    "firefox"
    "helix"
    "kitty"
    "lazyspotify"
    "legcord"
    "micro"
    "Minecraft"
    "neovim"
    "prismlauncher"
    "gonwatch"
  ];

  non-module-requiring-apps = with pkgs; {
    "google-chrome" = google-chrome;
    obsidian = obsidian;
    planify = planify;
    gimp = gimp;
    imagemagick = imagemagick;
    switcheroo = switcheroo;
    haruna = haruna;
    mpv = mpv;
    imv = imv;
    "protonup-qt" = protonup-qt;
    mangohud = mangohud;
    easyeffects = easyeffects;
    qbittorrent = qbittorrent;
    pdfarranger = pdfarranger;
    evince = evince;
    "gnome-disk-utility" = gnome-disk-utility;
    thunar = thunar;
    "obs-studio" = obs-studio;
    ffmpeg = ffmpeg;
    "mission-center" = mission-center;
    spotify = spotify;
    spotify-player = spotify-player;
    vesktop = vesktop;
    "davinci-resolve" = davinci-resolve;
    "ani-cli" = ani-cli;
    "libreoffice-fresh" = libreoffice-fresh;
  };

  flatpak-apps = {
    heroic = "com.heroicgameslauncher.hgl";
    lutris = "net.lutris.Lutris";
    sokogrump = "ro.go.hmlendea.SokoGrump";
    aqueducts = "com.endlessnetwork.aqueducts";
    osu = "sh.ppy.osu";
    "minecraft-mojang" = "com.mojang.Minecraft";
  };

  all-apps =
    module-requiring-apps
    ++ builtins.attrNames non-module-requiring-apps
    ++ builtins.attrNames flatpak-apps;

  app-options = builtins.listToAttrs (
    map (name: {
      inherit name;
      value = lib.mkEnableOption "Enable ${name}";
    }) all-apps
  );
in
{
  options.my.apps = lib.mkOption {
    type = lib.types.submodule { options = app-options; };
    default = { };
  };

  imports = [
    ../packages/applications/dolphin/package.nix
    ../packages/applications/discord/package.nix
    ../packages/applications/firefox/package.nix
    ../packages/applications/helix/package.nix
    ../packages/applications/legcord/package.nix
    ../packages/applications/micro/package.nix
    ../packages/applications/neovim/package.nix
    ../packages/applications/prismlauncher/package.nix
    ../packages/applications/lazyspotify/package.nix
    ../packages/applications/kitty/package.nix
    ../packages/applications/gonwatch/package.nix
  ];

  config = {
    home.packages = builtins.concatLists (
      builtins.attrValues (
        builtins.mapAttrs (name: pkg: lib.optional config.my.apps."${name}" pkg) non-module-requiring-apps
      )
    );

    services.flatpak.packages = builtins.attrValues (
      lib.filterAttrs (name: id: config.my.apps."${name}") flatpak-apps
    );
  };
}
