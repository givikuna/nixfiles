{
  pkgs,
  lib,
  groups,
  ...
}:
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
    ./devtools/jj.nix

    ./devtools/spell-checker.nix

    ./devtools/qt.nix

    ./devtools/debug.nix
    ./devtools/devenv.nix
    ./devtools/direnv.nix
    ./devtools/nix.nix
    ./devtools/shell.nix
    ./devtools/nickel.nix
  ]
  ++ lib.optionals groups.imbaers [
    ./devtools/imba.nix
  ];

  home.packages = with pkgs; [
    # livescript

    eask-cli
  ];
}
