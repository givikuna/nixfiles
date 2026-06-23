{
  lib,
  #pkgs,
  ...
}:
let
  find-package-modules =
    dir:
    let
      sub-modules = lib.flatten (
        lib.mapAttrsToList (name: _: find-package-modules (dir + "/${name}")) (
          lib.filterAttrs (name: type: type == "directory") (builtins.readDir dir)
        )
      );
      own-module =
        if builtins.pathExists (dir + "/package.nix") then [ (import (dir + "/package.nix")) ] else [ ];
    in
    own-module ++ sub-modules;

  all-package-modules = find-package-modules ../packages/configurations/applications;
  # extra-derivs = with pkgs; [
  #
  # ];
in
{
  imports = all-package-modules;

  # home.packages = extra-derivs;
}
