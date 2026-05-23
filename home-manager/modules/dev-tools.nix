{ pkgs, ... }:
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

    python3
    python3Packages.pip

    lua
    stylua

    nixd
    nixfmt

    jq

    # ui tools

    grpcui
    insomnia
    postman
  ];
}
