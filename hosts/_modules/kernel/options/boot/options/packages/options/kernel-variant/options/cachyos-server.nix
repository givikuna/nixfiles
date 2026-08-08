{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.kernel.boot.packages.kernel-variant.cachyos-server-kernel;
in
{
  options.custom.kernel.boot.packages.kernel-variant.cachyos-server-kernel.enable =
    lib.mkEnableOption "CachyOS Server Kernel";

  config = lib.mkIf cfg.enable {
    boot.kernelPackages = pkgs.linuxPackages_cachyos-server;
  };
}
