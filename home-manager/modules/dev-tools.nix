{ pkgs, ... }:
#let
# livescript = import ../packages/derivations/tools/livescript/derivation.nix { inherit pkgs lib; };
#in
{
  imports = [
    ./devtools/fmt.nix
    ./devtools/lsp.nix
    ./devtools/spell-checker.nix
    ./devtools/qt.nix
    ./devtools/maker.nix
  ];

  home.packages = with pkgs; [
    gcc
    ninja

    gdb
    valgrind
    clang-tools
    cppcheck

    nodejs_22
    typescript
    bun
    # livescript

    python3
    python3Packages.pip

    jdk

    lua

    jq

    racket

    eask-cli
  ];
}
