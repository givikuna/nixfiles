{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    nixd

    nixfmt

    statix

    nix-melt
  ];
}
