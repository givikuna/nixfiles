{ pkgs, inputs, ... }:

let
  gonwatch-patched = inputs.gonwatch.packages.${pkgs.system}.default.overrideAttrs (oldAttrs: {
    doCheck = false;
  });
in
{
  home.packages = [
    pkgs.ani-cli

    gonwatch-patched
  ];
}
