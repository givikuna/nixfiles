{
  config,
  lib,
  ...
}:
let
  cfg = config.custom.kernel.drivers.xpadneo;
in
{
  options.custom.kernel.drivers.xpadneo.enable =
    lib.mkEnableOption "xpadneo Xbox One Wireless Gamepad Driver";

  config = lib.mkIf cfg.enable {
    hardware.xpadneo.enable = true;
  };
}
