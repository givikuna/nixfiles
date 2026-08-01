{ config, lib, ... }:
let
  cfg = config.custom.kernel.services.scx;
in
{
  options.custom.kernel.services.scx.enable = lib.mkEnableOption "scx framework";

  config = lib.mkIf cfg.enable {
    services.scx.enable = true;
  };
}
