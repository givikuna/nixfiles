{ pkgs, ... }:
{
  imports = [
    ./nutils/nutils.nix
  ];

  home.packages = with pkgs; [
    curl

    ouch

    zenith
    bandwhich

    tokei

    fzf

    yt-dlp
  ];
}
