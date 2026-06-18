{ pkgs, inputs, ... }:
{
  imports = [
    ./modules/swayosd.nix
    ./modules/tuigreet.nix

    ../wayland/wayland.nix
  ];

  programs.hyprland = {
    enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  environment.systemPackages = [
    inputs.hyprland-virtual-desktops.packages.${pkgs.stdenv.hostPlatform.system}.virtual-desktops
  ];

  environment.pathsToLink = [ "/share/hypr" ];
}
