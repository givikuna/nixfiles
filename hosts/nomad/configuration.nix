{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../common.nix

    ../_modules/desktops/hyprland.nix
  ];

  services.tlp.enable = true;

  networking.hostName = "nomad";
}
