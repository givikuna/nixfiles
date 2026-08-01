{ pkgs, ... }:
{
  imports = [
    ./nutils/nutils.nix

    ../packages/configurations/tools/emacs/package.nix
  ];

  home.packages = with pkgs; [
    curl

    zenith
    bandwhich

    tokei

    yt-dlp

    repomix
    cava

    sioyek

    caligula

    speedtest-cli
  ];
}
