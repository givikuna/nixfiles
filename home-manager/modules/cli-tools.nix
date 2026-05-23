{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    curl

    ripgrep # grep
    fd # find
    eza # ls
    bat # cat
    zoxide # cd
    inputs.rip.packages.${pkgs.system}.default # rm
    sd # sed
    xh # curl/httpie

    dust # du
    broot # tree
    ouch

    bottom # top
    zenith
    bandwhich
    procs # ps

    delta # diff
    tokei
    hyperfine # time

    comma

    lazygit

    yt-dlp
  ];
}
