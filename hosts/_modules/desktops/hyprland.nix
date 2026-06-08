{ pkgs, ... }:
{
  imports = [
    ./modules/swayosd.nix
    ./modules/tuigreet.nix

    ../wayland/wayland.nix
  ];

  programs.hyprland.enable = true;
  programs.hyprland.portalPackage = pkgs.xdg-desktop-portal-hyprland;

  environment.pathsToLink = [ "/share/hypr" ];
}
