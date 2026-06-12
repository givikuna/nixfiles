{ ... }:
{
  imports = [
    ../common.nix

    ../modules/desktop/hyprgruvbox/desktop.nix
  ];

  my.apps = {
    discord = true;
    dolphin = true;
    firefox = true;
    helix = true;
    kitty = true;
    lazyspotify = true;
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
    # "davinci-resolve" = true;

    "ani-cli" = true;

    "libreoffice-fresh" = true;

    gonwatch = true;

    tuxedo = true;
  };
}
