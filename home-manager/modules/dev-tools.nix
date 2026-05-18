{ pkgs, ... }: {
  home.packages = with pkgs; [
    nodejs_20
    typescript
    livescript
    coffeescript
    purescript
    spago

    python3
    python3Packages.pip
  ];
}
