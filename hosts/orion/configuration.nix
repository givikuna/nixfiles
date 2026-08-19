{ ... }:
{
  imports = [
    ../common.nix

    # ./hardware-configuration.nix
    ../_modules/system/sys-cleanup.nix
    ../_modules/system/shell-dec.nix

    ./modules/certs.nix
    ./modules/certs.nix
  ];

  fileSystems."/" = {
    device = "/dev/sda1
    ";
    fsType = "ext4";
  };

  networking.hostName = "orion";
}
