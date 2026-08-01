{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.kernel.boot.packages.kernel-variant.default-kernel;
in
{
  options.custom.kernel.boot.packages.kernel-variant.default-kernel.enable =
    lib.mkEnableOption "Default Kernel";

  config = lib.mkIf cfg.enable {
    boot.kernelPackages = pkgs.linuxPackages;
  };
}
