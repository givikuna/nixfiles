{
  lib,
  groups,
  pkgs,
  ...
}:
{
  home.packages =
    [ ]
    ++ ((with lib; optionals) (with groups; torrers) (
      with pkgs;
      [
        tor-browser
      ]
    ));
}
