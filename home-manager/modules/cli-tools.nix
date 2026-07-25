{ pkgs, ... }:
{
  imports = [
    ./nutils/nutils.nix
    ../packages/configurations/tools/emacs/package.nix
  ];

  home.packages = with pkgs; [
    curl

    ouch

    zenith
    bandwhich

    tokei

    fzf

    yt-dlp

    repomix
    cava

    sioyek

    caligula

    speedtest-cli
  ];
}
