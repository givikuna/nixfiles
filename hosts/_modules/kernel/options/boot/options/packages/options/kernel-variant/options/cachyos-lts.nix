{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.kernel.boot.packages.kernel-variant.cachyos-lts-kernel;
in
{
  options.custom.kernel.boot.packages.kernel-variant.cachyos-lts-kernel.enable =
    lib.mkEnableOption "CachyOS LTS Kernel";

  config = lib.mkIf cfg.enable {
    boot.kernelPackages = pkgs.linuxPackages_cachyos-lts;
  };
}
