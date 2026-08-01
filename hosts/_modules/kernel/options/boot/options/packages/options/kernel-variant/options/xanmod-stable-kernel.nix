{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.kernel.boot.packages.kernel-variant.xanmod-stable-kernel;
in
{
  options.custom.kernel.boot.packages.kernel-variant.xanmod-stable-kernel.enable =
    lib.mkEnableOption "Xanmod Stable Kernel";

  config = lib.mkIf cfg.enable {
    boot.kernelPackages = pkgs.linuxPackages_xanmod_stable;
  };
}
