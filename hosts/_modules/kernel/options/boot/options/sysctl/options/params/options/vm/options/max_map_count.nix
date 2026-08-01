{ config, lib, ... }:
let
  cfg = config.custom.kernel.boot.sysctl.params.max_map_count;
in
{
  options.custom.kernel.boot.sysctl.params.max_map_count.enable =
    lib.mkEnableOption "vm.max_map_count tweak";

  config = lib.mkIf cfg.enable {
    boot.kernel.sysctl = {
      "vm.max_map_count" = 2147483642;
    };
  };
}
