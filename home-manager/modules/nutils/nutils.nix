{ pkgs, inputs, ... }:
{
  imports = [
    ../../packages/tools/zoxide/package.nix # cd
    ../../packages/tools/bat/package.nix # cat
  ];

  home.packages = with pkgs; [
    ripgrep # grep
    fd # find
    eza # ls
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
