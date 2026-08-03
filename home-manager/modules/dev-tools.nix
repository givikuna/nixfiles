{ pkgs, ... }:
#let
# livescript = import ../packages/derivations/tools/livescript/derivation.nix { inherit pkgs lib; };
#in
{
  imports = [
    # ./devtools/android-dev.nix

    ./devtools/c.nix
    ./devtools/javascript.nix
    ./devtools/lua.nix
    ./devtools/make.nix
    ./devtools/python.nix
    ./devtools/racket.nix
    ./devtools/jdk.nix
    ./devtools/perl.nix

    ./devtools/spell-checker.nix

    ./devtools/qt.nix

    ./devtools/debug.nix
    ./devtools/devenv.nix
    ./devtools/direnv.nix
    ./devtools/nix.nix
    ./devtools/shell.nix
  ];

  home.packages = with pkgs; [
    # livescript

    eask-cli
  ];
}
