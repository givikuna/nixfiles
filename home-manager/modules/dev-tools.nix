{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs_22
    typescript

    python3
    python3Packages.pip

    lua
    stylua

    nixd
    nixfmt

    jq
  ];
}
