{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.kernel.boot.packages.packages.bbswitch;
in
{
  options.custom.kernel.boot.packages.packages.bbswitch.enable =
    lib.mkEnableOption "bbswitch Kernel Package";

  config = lib.mkIf cfg.enable {
    boot.kernelPackages = pkgs.bbswitch;
  };
}
