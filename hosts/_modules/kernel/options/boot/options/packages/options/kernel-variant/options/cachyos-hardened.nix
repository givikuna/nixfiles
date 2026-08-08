{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.kernel.boot.packages.kernel-variant.cachyos-hardened-kernel;
in
{
  options.custom.kernel.boot.packages.kernel-variant.cachyos-hardened-kernel.enable =
    lib.mkEnableOption "CachyOS Hardened Kernel";

  config = lib.mkIf cfg.enable {
    boot.kernelPackages = pkgs.linuxPackages_cachyos-hardened;
  };
}
