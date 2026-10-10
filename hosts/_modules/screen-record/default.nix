{
  lib,
  groups,
  ...
}:
{
  imports =
    [ ]
    ++ lib.optionals groups.gpu-screen-recorderers [
      ./modules/gpu-screen-recorder.nix
    ];
}
