{ pkgs, ... }: {
  home.packages = with pkgs; [
    nodejs_20
    typescript
    ts-node
    livescript
    coffeescript
    purescript
    spago

    python3
    python3Packages.pip
  ];
}
