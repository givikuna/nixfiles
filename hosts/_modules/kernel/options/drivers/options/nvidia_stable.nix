{
  config,
  lib,
  ...
}:
let
  cfg = config.custom.kernel.drivers.nvidia_stable;
in
{
  options.custom.kernel.drivers.nvidia_stable.enable =
    lib.mkEnableOption "Default stable drivers for NVIDIA";

  config = lib.mkIf cfg.enable {
    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
