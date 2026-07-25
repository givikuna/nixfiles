{ pkgs, ... }: {
  home.packages = with pkgs; [
    pdfarranger
    evince
    gnome-disk-utility
    mission-center

    haruna
    mpv
    imv
    ffmpeg
    libreoffice-fresh
  ];
}
