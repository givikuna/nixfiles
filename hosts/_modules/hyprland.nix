{ pkgs, ... }:
{
  programs.hyprland.enable = true;
  programs.hyprland.portalPackage = pkgs.xdg-desktop-portal-hyprland;

  environment.pathsToLink = [ "/share/hypr" ];
}
