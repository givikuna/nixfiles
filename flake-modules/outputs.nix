{ inputs, ... }:
let
  mkHost =
    {
      hostname,
      username ? "givik",
      system ? "x86_64-linux",
    }:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs username; };
      system = system;

      modules = [
        ../hosts/${hostname}/configuration.nix
        inputs.nix-flatpak.nixosModules.nix-flatpak
        inputs.sops-nix.nixosModules.sops
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";

            extraSpecialArgs = {
              inherit inputs username;
              host-name = hostname;
            };

            sharedModules = [
              inputs.nix-flatpak.homeManagerModules.nix-flatpak
              inputs.sops-nix.homeManagerModules.sops
            ];

            users.${username} = import ../home-manager/hosts/${hostname}.nix;
          };
        }
      ];
    };
in
{
  nixosConfigurations = {
    minotaur = mkHost { hostname = "minotaur"; };
    nomad = mkHost { hostname = "nomad"; };
    pilgrim = mkHost { hostname = "pilgrim"; };
  };
}
