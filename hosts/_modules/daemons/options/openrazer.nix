{
  config,
  lib,
  pkgs,
  username,
  ...
}:
let
  cfg = config.custom.daemons.razer;
in
{
  options.custom.daemons.razer.enable = lib.mkEnableOption "OpenRazer Daemon";

  config = lib.mkIf cfg.enable {
    hardware.openrazer.enable = true;
    environment.systemPackages = with pkgs; [
      openrazer-daemon

      polychromatic
    ];
    users.users.${username} = {
      extraGroups = [ "openrazer" ];
    };
  };
}
