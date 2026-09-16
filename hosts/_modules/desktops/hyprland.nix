{ pkgs, ... }:
{
  imports = [
    ./modules/swayosd.nix
    ./modules/tuigreet.nix

    ./modules/wayland/wayland.nix
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # inputs.hyprland-virtual-desktops.packages.${pkgs.stdenv.hostPlatform.system}.virtual-desktops

    grim
    slurp
  ];

  environment.pathsToLink = [ "/share/hypr" ];

  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-hyprland
  ];
}
