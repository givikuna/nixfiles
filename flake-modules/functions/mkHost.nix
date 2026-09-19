{ inputs, ... }:
{
  hostname,
  username ? "givik",
  system ? "x86_64-linux",
}:
let
  nixtants =
    let
      m_mod =
        let
          lib = inputs.nixpkgs.lib;
        in
        (lib.evalModules {
          modules = [
            ../../nixtants

            {
              options.nixtants = lib.mkOption {
                type = lib.types.mkOptionType {
                  name = "nixtants";
                  description = "free-form namespace";
                  check = _: true;
                  merge = _loc: defs: builtins.foldl' lib.recursiveUpdate { } (map (d: d.value) defs);
                };
                default = { };
              };
            }
          ];
        });
    in
    m_mod.config.nixtants;
in
inputs.nixpkgs.lib.nixosSystem {
  specialArgs = { inherit inputs username; };
  system = system;

  modules = [
    ../../hosts/${hostname}/configuration.nix
    inputs.nix-flatpak.nixosModules.nix-flatpak
    inputs.chaotic.nixosModules.default
    inputs.agenix.nixosModules.default

    # nixtants
    inputs.nixtants.nixosModules.default
    ../../nixtants

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

          inherit nixtants;
        };

        sharedModules = [
          inputs.nix-flatpak.homeManagerModules.nix-flatpak
        ];

        users.${username} = import ../../home-manager/hosts/${hostname}.nix;
      };
    }
  ];
}
