{ inputs, ... }:
let
  system = "x86_64-linux";

  pkgs = import inputs.nixpkgs {
    inherit system;
    config = {
      allowUnfree = true;
      android_sdk.accept_license = true;
    };
    overlays = [ inputs.nur.overlays.default ];
  };

  mkHost = import ./functions/mkHost.nix { inherit inputs; };

  hosts = {
    minotaur = { };
    nomad = { };
    pilgrim = { };
    colossus = { };
    # zephyr = { username = "larryrh"; };
  };

  nixosConfigurations = builtins.mapAttrs (
    hostname: args: mkHost ({ inherit hostname; } // args)
  ) hosts;

  tests = import ../tests/default.nix {
    inherit pkgs hosts inputs;
    lib = inputs.nixpkgs.lib;
  };
in
{
  inherit nixosConfigurations;

  checks.${system} = tests;
}
