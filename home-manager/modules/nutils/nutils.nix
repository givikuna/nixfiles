{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
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
    bottom # top
    delta # diff
    procs # ps
    hyperfine # time
  ];
}
