{ inputs, ... }:
{
  hostname,
  username ? "givik",
  system ? "x86_64-linux",
}:
inputs.nixpkgs.lib.nixosSystem {
  specialArgs = { inherit inputs username; };
  system = system;

  modules = [
    ../../hosts/${hostname}/configuration.nix
    inputs.nix-flatpak.nixosModules.nix-flatpak
    inputs.chaotic.nixosModules.default
    inputs.agenix.nixosModules.default
    # inputs.nixtants.nixosModules.default

    {
      nixpkgs.overlays = [
        inputs.guixpkgs.overlays.default
        inputs.nur.overlays.default
      ];

      nix.settings = {
        # cachix guixpkgs cache
        extra-substituters = [ "https://guixpkgs.cachix.org" ];
        extra-trusted-public-keys = [
          "guixpkgs.cachix.org-1:rM4xwCs5NUy+FcCKkiWP/CmRaSVxxDPaKWZvM1bRopg="
        ];
      };
    }

    # home-manager
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
        ];

        users.${username} = import ../../home-manager/hosts/${hostname}.nix;
      };
    }
  ];
}
