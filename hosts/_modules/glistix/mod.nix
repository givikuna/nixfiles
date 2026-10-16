{ inputs, pkgs, ... }:
let
  glistix-patched =
    with inputs;
    let
      g = glistix;
    in
    (
      with g;
      packages.${
        let
          p = pkgs;
        in
        (with p; stdenv.hostPlatform.system)
      }.default.overrideAttrs
        (
          let
            f = (
              old: {
                cargoDeps = old.cargoDeps.overrideAttrs (_: {
                  outputHash = "sha256-073LUpMgDJ2N/MSGae8741ScF/dxQXBykWlInJ5uHEs=";
                });
              }
            );
          in
          f
        )
    );
in
{
  environment.systemPackages = [
    glistix-patched
  ];
}
