{ ... }:
{
  imports = [
    ../common.nix

    # ./hardware-configuration.nix
    ../_modules/system/sys-cleanup.nix
    ../_modules/system/shell-dec.nix
  ];

  fileSystems."/" = {
    device = "nodev";
    fsType = "tmpfs";
  };

  networking.hostName = "orion";
}
