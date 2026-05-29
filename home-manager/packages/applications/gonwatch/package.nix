{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

let
  gonwatch-patched = inputs.gonwatch.packages.${pkgs.system}.default.overrideAttrs (oldAttrs: {
    doCheck = false;
  });
in
lib.mkIf config.my.apps.gonwatch {
  home.packages = [
    gonwatch-patched
  ];
}
