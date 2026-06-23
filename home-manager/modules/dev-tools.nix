{ pkgs, lib, ... }:
let
  livescript = import ../packages/derivations/tools/livescript/derivation.nix { inherit pkgs lib; };
in
{
  home.packages = with pkgs; [
    vscode # always needed :()

    gcc
    gnumake
    cmake
    ninja

    gdb
    valgrind
    clang-tools
    cppcheck

    qtcreator
    qt6.qttools
    qt6.qtbase
    qt6.qtdeclarative

    nodejs_22
    typescript
    livescript

    python3
    python3Packages.pip

    lua
    stylua

    nixd
    nixfmt

    jq

    grpcui
    insomnia
    postman
  ];
}
