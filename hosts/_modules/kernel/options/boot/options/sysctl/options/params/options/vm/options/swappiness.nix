{ config, lib, ... }:
let
  cfg = config.custom.kernel.boot.sysctl.params.swappiness;
in
{
  options.custom.kernel.boot.sysctl.params.swappiness.enable =
    lib.mkEnableOption "vm.swappiness tweak";

  config = lib.mkIf cfg.enable {
    boot.kernel.sysctl = {
      "vm.swappiness" = 10;
    };
  };
}
