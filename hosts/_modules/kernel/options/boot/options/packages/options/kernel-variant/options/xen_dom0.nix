{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.kernel.boot.packages.kernel-variant.xen_dom0-kernel;
in
{
  options.custom.kernel.boot.packages.kernel-variant.xen_dom0-kernel.enable =
    lib.mkEnableOption "xen_dom0 Kernel";

  config = lib.mkIf cfg.enable {
    boot.kernelPackages = pkgs.linuxPackages_xen_dom0;
  };
}
