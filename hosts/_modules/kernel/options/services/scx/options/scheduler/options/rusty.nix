{ config, lib, ... }:
let
  cfg = config.custom.kernel.services.scx.scheduler.rustland;
in
{
  options.custom.kernel.services.scx.scheduler.rusty.enable =
    lib.mkEnableOption "scx rusty scheduler";

  config = lib.mkIf cfg.enable {
    services.scx.scheduler = "scx_rusty";
  };
}
