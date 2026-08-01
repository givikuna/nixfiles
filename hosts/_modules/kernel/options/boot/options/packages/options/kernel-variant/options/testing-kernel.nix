{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.kernel.boot.packages.kernel-variant.testing-kernel;
in
{
  options.custom.kernel.boot.packages.kernel-variant.testing-kernel.enable = lib.mkEnableOption "Testing Kernel";

  config = lib.mkIf cfg.enable {
    boot.kernelPackages = pkgs.linuxPackages_testing;
  };
}
