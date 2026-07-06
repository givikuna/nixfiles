{ ... }:
{
  imports = [
    # ../common.nix (runs on ZorinOS so doesn't use common.nix anymore)
    ./hardware-configuration.nix
    ../_modules/system/sys-cleanup.nix
    ../_modules/system/shell-dec.nix
  ];

  networking.hostName = "pilgrim";
}
