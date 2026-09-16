{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.daemons.power-profiles;
in
{
  options.custom.daemons.power-profiles.enable = lib.mkEnableOption "power profiles daemon";

  config = lib.mkIf cfg.enable {
    services.power-profiles-daemon.enable = true;
  };
}
