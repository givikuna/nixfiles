{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../common.nix

    # ../_modules/desktops/hyprland.nix
    ../_modules/desktops/gnome.nix
  ];

  services.tlp.enable = true;

  networking.hostName = "nomad";
}
