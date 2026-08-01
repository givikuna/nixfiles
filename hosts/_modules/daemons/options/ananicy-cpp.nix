{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.daemons.ananicy-cpp;
in
{
  options.custom.daemons.ananicy-cpp.enable = lib.mkEnableOption "ananicy-cpp with CachyOS ruleset";

  config = lib.mkIf cfg.enable {
    services.ananicy = with pkgs; {
      enable = true;
      package = ananicy-cpp;
      rulesProvider = ananicy-rules-cachyos;
    };
  };
}
# automatic process nice-ing
