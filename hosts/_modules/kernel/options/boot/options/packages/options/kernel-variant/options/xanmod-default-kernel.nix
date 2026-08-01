{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.kernel.boot.packages.kernel-variant.xanmod-default-kernel;
in
{
  options.custom.kernel.boot.packages.kernel-variant.xanmod-default-kernel.enable = lib.mkEnableOption "Xanmod Kernel";

  config = lib.mkIf cfg.enable {
    boot.kernelPackages = pkgs.linuxPackages_xanmod;
  };
}
