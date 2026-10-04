{ inputs, self, ... }:
let
  system = "x86_64-linux";

  pkgs = import inputs.nixpkgs {
    inherit system;
    config = {
      allowUnfree = true;
      android_sdk.accept_license = true;
    };
    overlays = [
      inputs.nur.overlays.default
      # inputs.guixpkgs.overlays.default
    ];
  };

  nixosConfigurations =
    let
      mkHost = import ./functions/mkHost.nix { inherit inputs; };

      hosts = {
        minotaur = { };
        nomad = { };
        pilgrim = { };
        colossus = { };
        orion = { };
        # zephyr = { username = "larryrh"; };
      };
    in
    builtins.mapAttrs (hostname: args: mkHost ({ inherit hostname; } // args)) hosts;

  # tests = import ../tests/default.nix {
  #   inherit pkgs hosts inputs;
  #   lib = inputs.nixpkgs.lib;
  # };

  repo-version =
    let
      lib = inputs.nixpkgs.lib;
    in
    lib.strings.trim (builtins.readFile ../.version);

  full-version = "${repo-version}+${self.shortRev or self.dirtyShortRev or "dirty"}";

  build-date =
    let
      d = self.lastModifiedDate or "19700101";
    in
    builtins.concatStringsSep "-" (builtins.match "(.{4})(.{2})(.{2})" d);

  nixtestRunner = import ./tests/tests.nix {
    inherit inputs pkgs nixosConfigurations;
  };
in
{
  inherit nixosConfigurations;

  lib = {
    inherit repo-version full-version build-date;

    commit = self.rev or null;
    isDirty = !(self ? rev);
  };

  # checks.${system} = tests;
  packages.${system} = {
    tests = nixtestRunner;

    # nix run .#version
    version = pkgs.writeShellScriptBin "version" ''
      echo "repo version: ${repo-version}"
      echo "full version: ${full-version}"
      echo "commit:       ${toString (self.rev or "uncommitted")}"
      echo "built from:   ${build-date}"
      echo "dirty:        ${if !(self ? rev) then "yes" else "no"}"
    '';
  };
}
