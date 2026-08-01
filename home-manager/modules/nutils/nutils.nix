{ pkgs, inputs, ... }:
{
  imports = [
    ../../packages/configurations/tools/zoxide/package.nix # cd
    ../../packages/configurations/tools/bat/package.nix # cat
    ../../packages/configurations/tools/broot/package.nix # tree

    ./modules/top.nix # top
    ./modules/git.nix
    ./modules/json.nix
    ./modules/log.nix
    ./modules/html.nix
  ];

  home.packages = with pkgs; [
    inputs.rip.packages.${pkgs.stdenv.hostPlatform.system}.default # rm

    ripgrep # grep

    fd # find
    fzf

    eza # ls

    sd # sed
    xh # curl/httpie
    dust # du
    delta # diff
    procs # ps
    hyperfine # time
    ouch # zip
    bandwhich
  ];
}
