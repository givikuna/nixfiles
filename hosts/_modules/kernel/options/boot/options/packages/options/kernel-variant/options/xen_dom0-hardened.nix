{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.kernel.boot.packages.kernel-variant.xem_dom0-hardened-kernel;
in
{
  options.custom.kernel.boot.packages.kernel-variant.xem_dom0-hardened-kernel.enable =
    lib.mkEnableOption "xem_dom0 Hardened Kernel";

  config = lib.mkIf cfg.enable {
    boot.kernelPackages = pkgs.linuxPackages_xen_dom0_hardened;
  };
}
