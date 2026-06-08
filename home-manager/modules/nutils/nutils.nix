{ pkgs, inputs, ... }:
{
  imports = [
    ../../packages/tools/zoxide/package.nix # cd
    ../../packages/tools/bat/package.nix # cat
    ../../packages/tools/broot/package.nix # tree
  ];

  home.packages = with pkgs; [
    ripgrep # grep
    fd # find
    eza # ls
    inputs.rip.packages.${pkgs.stdenv.hostPlatform.system}.default # rm
    sd # sed
    xh # curl/httpie
    dust # du
    bottom # top
    delta # diff
    procs # ps
    hyperfine # time
  ];
}
