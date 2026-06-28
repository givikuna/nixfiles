{ ... }:
{
  imports = [
    ../common.nix
    ./hardware-configuration.nix

    ../_modules/desktops/gnome.nix

    ../_modules/misc/boxes.nix
    ../_modules/misc/protonvpn.nix
    ../_modules/misc/steam-config.nix
  ];

  networking.hostName = "pilgrim";

}
