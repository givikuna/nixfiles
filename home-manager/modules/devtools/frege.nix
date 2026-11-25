{
  gvpkgs,
  lib,
  groups,
  ...
}:
{
  home.packages =
    [ ]
    ++ lib.optionals groups.gvpkgers (
      with gvpkgs;
      [
        fregec
      ]
    );
}
