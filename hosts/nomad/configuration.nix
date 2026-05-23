{ ... }:
{
  imports = [
    ../common.nix
    ./hardware-configuration.nix
    ../modules/boxes.nix
  ];

  networking.hostName = "nomad";
}
