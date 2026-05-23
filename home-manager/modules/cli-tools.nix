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

    comma

    lazygit

    yt-dlp
  ];
}
