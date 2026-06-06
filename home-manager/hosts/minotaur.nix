{ ... }:
{
  imports = [
    ../common.nix
    ../modules/desktop/desktop-minotaur.nix
  ];

  my.apps = {
    discord = true;
    dolphin = true;
    firefox = true;
    helix = true;
    kitty = true;
    lazyspotify = true;
    legcord = true;
    micro = true;
    neovim = true;
    prismlauncher = true;

    "google-chrome" = true;
    obsidian = true;
    planify = true;
    gimp = true;
    imagemagick = true;
    switcheroo = true;
    haruna = true;
    mpv = true;
    imv = true;
    "protonup-qt" = true;
    mangohud = true;
    easyeffects = true;
    qbittorrent = true;
    pdfarranger = true;
    evince = true;
    "gnome-disk-utility" = true;
    thunar = true;
    "obs-studio" = true;
    ffmpeg = true;
    "mission-center" = true;
    spotify = true;
    spotify-player = true;
    vesktop = true;
    "davinci-resolve" = true;

    heroic = true;
    lutris = true;
    sokogrump = true;
    aqueducts = true;
    osu = true;
    "minecraft-mojang" = true;

    "ani-cli" = true;

    "libreoffice-fresh" = true;

    gonwatch = true;

    tuxedo = true;

    thunderbird = true;

    chronicler = true;
  };
}
