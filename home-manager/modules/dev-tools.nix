{ pkgs, ... }: {
  home.packages = with pkgs; [
    nodejs_20
    nodePackages.typescript
    nodePackages.ts-node
    nodePackages.livescript
    nodePackages.coffeescript
    purescript
    spago

    python3
    python3Packages.pip
  ];
}
