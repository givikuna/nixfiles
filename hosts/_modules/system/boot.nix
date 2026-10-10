{
  lib,
  groups,
  ...
}:
{
  imports =
    [ ]
    ++ lib.optionals groups.systemd-booters [
      ./boot/systemd.nix
    ]
    ++ lib.optionals groups.grubbers [
      ./boot/grub.nix
    ];
  boot.loader.efi.canTouchEfiVariables = true;
}
