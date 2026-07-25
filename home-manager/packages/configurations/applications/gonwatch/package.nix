{ pkgs, inputs, ... }:

let
  # mpv-wrapped = pkgs.writeShellScriptBin "mpb" ''
  #   exec ${pkgs.mpv}/bin/mpv --vo=wayland "$@"
  # '';
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
