{ pkgs, lib, ... }:
let
  livescript = import ./derivations/livescript/package.nix { inherit pkgs lib; };
in
{
  imports = [
    ./applications/git.nix
  ];

  home.packages = with pkgs; [
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
    lua-language-server
    stylua

    nixd
    nixfmt

    jq

    grpcui
    insomnia
    postman
  ];
}
