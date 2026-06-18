{ ... }:
{
  imports = [
    ../common.nix
    ./hardware-configuration.nix

    ../_modules/desktops/gnome.nix

    ../_modules/misc/boxes.nix
  ];

  networking.hostName = "pilgrim";
}
