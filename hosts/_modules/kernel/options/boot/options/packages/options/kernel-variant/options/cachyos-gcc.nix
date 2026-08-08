{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.kernel.boot.packages.kernel-variant.cachyos-gcc-kernel;
in
{
  options.custom.kernel.boot.packages.kernel-variant.cachyos-gcc-kernel.enable =
    lib.mkEnableOption "CachyOS GCC Kernel";

  config = lib.mkIf cfg.enable {
    boot.kernelPackages = pkgs.linuxPackages_cachyos-gcc;
  };
}
