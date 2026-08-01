{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.kernel.boot.packages.kernel-variant.latest-kernel;
in
{
  options.custom.kernel.boot.packages.kernel-variant.latest-kernel.enable = lib.mkEnableOption "Latest Kernel";

  config = lib.mkIf cfg.enable {
    boot.kernelPackages = pkgs.linuxPackages_latest;
  };
}
