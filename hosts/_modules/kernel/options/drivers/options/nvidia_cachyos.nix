{
  config,
  lib,
  ...
}:
let
  cfg = config.custom.kernel.drivers.nvidia_cachyos;
in
{
  options.custom.kernel.drivers.nvidia_cachyos.enable =
    lib.mkEnableOption "CachyOS-made drivers for NVIDIA through Chaotic-Nyx";

  config = lib.mkIf cfg.enable {
    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.cachyos;
  };
}
