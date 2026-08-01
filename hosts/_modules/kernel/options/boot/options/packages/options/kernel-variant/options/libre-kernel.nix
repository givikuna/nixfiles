{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.kernel.boot.packages.kernel-variant.libre-kernel;
in
{
  options.custom.kernel.boot.packages.kernel-variant.libre-kernel.enable = lib.mkEnableOption "Libre Kernel";

  config = lib.mkIf cfg.enable {
    boot.kernelPackages = pkgs.linuxPackages-libre;
  };
}
