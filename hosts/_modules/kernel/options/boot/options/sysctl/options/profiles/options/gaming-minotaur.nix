{ config, lib, ... }:
let
  cfg = config.custom.kernel.boot.sysctl.profiles.gaming-minotaur;
in
{
  # imports = [
  #   ../../params/default.nix
  # ];

  options.custom.kernel.boot.sysctl.profiles.gaming-minotaur.enable =
    lib.mkEnableOption "gaming-minotaur sysctl profile";

  config = lib.mkIf cfg.enable {
    custom.kernel.boot.sysctl.params.max_map_count.enable = true;
    custom.kernel.boot.sysctl.params.swappiness.enable = true;
  };
}
