{ inputs, ... }:
let
  mkHost = import ./mkHost.nix { inherit inputs; };
in
{
  nixosConfigurations = {
    minotaur = mkHost { hostname = "minotaur"; };
    nomad = mkHost { hostname = "nomad"; };
    pilgrim = mkHost { hostname = "pilgrim"; };
  };
}
