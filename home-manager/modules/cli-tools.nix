{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ripgrep
    fd
    eza
    bat
    zoxide
    curl

    dust
    broot
    ouch

    bottom
    zenith
    bandwhich

    delta
    tokei

    comma

    git
    lazygit

    yt-dlp
  ];
}
