{ config, lib, ... }:
let
  cfg = config.custom.kernel.services.scx.scheduler.rustland;
in
{
  options.custom.kernel.services.scx.scheduler.rustland.enable =
    lib.mkEnableOption "scx rustland scheduler";

  config = lib.mkIf cfg.enable {
    services.scx.scheduler = "scx_rustland";
  };
}
