{ groups, lib, ... }: {
  imports =
    [ ]
    ++ lib.optionals groups.lenovo-legioners [
      ./hardware/l5p-rgb.nix
    ];
}
