{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.kernel.boot.packages.kernel-variant.hardened-kernel;
in
{
  options.custom.kernel.boot.packages.kernel-variant.hardened-kernel.enable = lib.mkEnableOption "Hardened Kernel";

  config = lib.mkIf cfg.enable {
    boot.kernelPackages = pkgs.linuxPackages_hardened;
  };
}
