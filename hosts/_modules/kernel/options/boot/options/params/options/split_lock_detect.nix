{
  config,
  lib,
  ...
}:
let
  cfg = config.custom.kernel.boot.params.split_lock_detect;
in
{
  options.custom.kernel.boot.params.split_lock_detect = lib.mkOption {
    type = lib.types.nullOr (
      lib.types.enum [
        "off"
        "warm"
        "fatal"
      ]
    );

    default = null;

    description = ''
      split Locks:
      "off" helps avoid stuttering in games
      leave at null to let the kernel decide
    '';
  };

  config = lib.mkIf (cfg != null) {
    boot.kernelParams = [
      "split_lock_detect=${cfg}"
    ];
  };
}
