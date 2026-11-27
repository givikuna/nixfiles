{
  l5p-keyboard-rgb,
  pkgs,
  lib,
  groups,
  ...
}:
{
  home.packages =
    [ ]
    ++ lib.optionals groups.lenovo-legioners [
      l5p-keyboard-rgb.packages.${pkgs.system}.default
    ];
}
