{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.kernel.boot.packages.kernel-variant.zen-kernel;
in
{
  options.custom.kernel.boot.packages.kernel-variant.zen-kernel.enable = lib.mkEnableOption "Zen Kernel";

  config = lib.mkIf cfg.enable {
    boot.kernelPackages = pkgs.linuxPackages_zen;
  };
}
