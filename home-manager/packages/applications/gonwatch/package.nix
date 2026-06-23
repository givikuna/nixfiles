{
  pkgs,
  inputs,
  ...
}:

let
  gonwatch-patched =
    inputs.gonwatch.packages.${pkgs.stdenv.hostPlatform.system}.default.overrideAttrs
      (oldAttrs: {
        doCheck = false;
      });
in
{
  home.packages = [
    gonwatch-patched
  ];
}
