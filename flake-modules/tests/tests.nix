{
  inputs,
  pkgs,
  nixosConfigurations,
  ...
}:
let
  lib = pkgs.lib;
  ntlib = inputs.nixtest.lib { inherit pkgs; };

  all-files = lib.filesystem.listFilesRecursive ../../tests;

  test-mods = builtins.filter (f: lib.hasSuffix "_test.nix" (toString f)) all-files;

  _ = builtins.trace "found test files of: ${builtins.toJSON (map toString test-mods)}" null;
in
ntlib.mkNixtest {
  modules = test-mods;

  args = {
    inherit
      pkgs
      ntlib
      inputs
      nixosConfigurations
      ;
  };
}
