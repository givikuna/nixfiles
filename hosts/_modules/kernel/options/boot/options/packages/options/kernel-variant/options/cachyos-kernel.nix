{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.kernel.boot.packages.kernel-variant.cachyos-kernel;
in
{
  options.custom.kernel.boot.packages.kernel-variant.cachyos-kernel.enable =
    lib.mkEnableOption "CachyOS Kernel";

  config = lib.mkIf cfg.enable {
    boot.kernelPackages = pkgs.linuxPackages_cachyos;
  };
}
