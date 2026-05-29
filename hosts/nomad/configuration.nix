{ ... }:
{
  imports = [
    ../common.nix
    ./hardware-configuration.nix
  ];

  services.tlp.enable = true;

  networking.hostName = "nomad";
}
