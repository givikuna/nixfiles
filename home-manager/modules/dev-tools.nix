{ pkgs, ... }: {
  home.packages = with pkgs; [
    nodejs_20
    typescript

    python3
    python3Packages.pip
  ];
}
