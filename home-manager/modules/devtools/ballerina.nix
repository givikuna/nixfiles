{
  lib,
  groups,
  gvpkgs,
  ...
}:
{
  home.packages =
    [ ]
    ++ lib.optionals groups.gvpkgers (
      with gvpkgs;
      [
        ballerina
      ]
    );
}
