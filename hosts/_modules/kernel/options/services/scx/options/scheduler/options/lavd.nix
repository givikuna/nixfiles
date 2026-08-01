{ config, lib, ... }:
let
  cfg = config.custom.kernel.services.scx.scheduler.lavd;
in
{
  options.custom.kernel.services.scx.scheduler.lavd.enable = lib.mkEnableOption "scx lavd scheduler";

  config = lib.mkIf cfg.enable {
    services.scx.scheduler = "scx_lavd";
  };
}
