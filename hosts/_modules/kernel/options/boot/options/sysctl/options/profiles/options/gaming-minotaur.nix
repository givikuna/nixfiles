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
    custom.kernel.boot.sysctl.params.vm.max_map_count = lib.mkDefault 2147483642;
    custom.kernel.boot.sysctl.params.vm.swappiness = lib.mkDefault 10;
  };
}
