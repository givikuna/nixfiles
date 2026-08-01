{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../_modules/system/sys-cleanup.nix
    ../_modules/system/shell-dec.nix
  ];

  networking.hostName = "orion";
}
