{ ... }:
{
  imports = [
    ../common.nix
    # ./hardware-configuration.nix

    ../_modules/desktops/hyprland.nix

    ../_modules/sec/tor.nix
    ../_modules/sec/firejail.nix

    ../_modules/misc/boxes.nix
  ];

  fileSystems."/" = {
    device = "/dev/sda1";
    fsType = "ext4";
  };

  networking.hostName = "colossus";
}
