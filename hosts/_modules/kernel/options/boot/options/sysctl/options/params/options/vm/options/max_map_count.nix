{ config, lib, ... }:
let
  cfg = config.custom.kernel.boot.sysctl.params.max_map_count;
in
{
  options.custom.kernel.boot.sysctl.params.max_map_count = lib.mkOption {
    type = lib.types.nullOr lib.types.int;
    default = null;
    description = "vm.max_map count value (null means do not set)";
  };

  config = lib.mkIf (cfg != null) {
    boot.kernel.sysctl = {
      "vm.max_map_count" = cfg;
    };
  };
}

# 2147483642
