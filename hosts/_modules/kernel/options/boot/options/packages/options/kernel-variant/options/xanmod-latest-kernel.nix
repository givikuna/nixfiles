{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.kernel.boot.packages.kernel-variant.xanmod-latest-kernel;
in
{
  options.custom.kernel.boot.packages.kernel-variant.xanmod-latest-kernel.enable =
    lib.mkEnableOption "Xanmod Latest Kernel";

  config = lib.mkIf cfg.enable {
    boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
  };
}
