{
  lib,
  groups,
  inputs,
  ...
}:
{
  imports = [
    #

    # ============================================
    #               CHAOTIC NYX
    # ============================================

    inputs.chaotic.nixosModules.default

    #

    # ============================================
    #               OPTNIX
    # ============================================

    # inputs.optnix.packages.${system}.optnix

    # inputs.optnix.nixosModules
    # inputs.optnix.homeModules

    # {
    #   nix.settings = {
    #     substituters = [ "https://watersucks.cachix.org" ];
    #     trusted-public-keys = [
    #       "watersucks.cachix.org-1:6gadPC5R8iLWQ3EUtfu3GFrVY7X6I4Fwz/ihW25Jbv8="
    #     ];
    #   };
    # }

    #

    # ============================================
    #                  YSYLDUR
    # ============================================

    # chaotic is already being imported

    inputs.ysyldur.nixosModules.default

    #

    # ============================================
    #                  TOPOLOGY
    # ============================================

    inputs.nix-topology.nixosModules.default
    {
      nixpkgs.overlays = [
        inputs.nix-topology.overlays.default
      ];
    }

    #

    # ============================================
    #                  NUR
    # ============================================

    {
      nixpkgs.overlays = [
        inputs.nur.overlays.default
      ];
    }

    #

    # ============================================
    #               CONSTANTS
    # ============================================

    inputs.nixtants.nixosModules.default

    ../../../nixtants

    {
      home-manager.sharedModules = [
        inputs.nixtants.homeModules.default
        ../../../nixtants
      ];
    }

    #

    # ============================================
    #               SECRETS
    # ============================================

    inputs.agenix.nixosModules.default

    inputs.ynternals.nixosModules.default
  ]
  ++ lib.optionals groups.multiversers [
    #

    # ============================================
    #                MULTIVERSE
    # ============================================

    inputs.multiverse.nixosModules.default

    # home manager
    {
      home-manager.sharedModules =
        with inputs;
        with multiverse;
        [
          homeManagerModules.default
        ];
    }
  ]
  ++ lib.optionals groups.glistixers [
    #

    # ============================================
    #                  GLISTIX
    # ============================================

    # {
    #   nixpkgs.overlays = [
    #     inputs.glistix.overlays.default
    #   ];
    # }
  ]
  ++ lib.optionals groups.rewinders [
    # ============================================
    #                  REWIND
    # ============================================

    inputs.rewind.nixosModules.default
  ]
  ++ lib.optionals groups.evixers [
    #

    # ============================================
    #                     EVIX
    # ============================================

    inputs.evix.nixosModules.default
  ]
  ++ lib.optionals groups.determinaters [
    #

    # ============================================
    #                  Determinate
    # ============================================

    # inputs.determinate.nixosModules.default
  ]
  ++ lib.optionals groups.guixers [
    #

    # ============================================
    #                  GUIX
    # ============================================

    {
      nixpkgs.overlays = [
        inputs.guixpkgs.overlays.default
      ];

      nix.settings = {
        extra-substituters = [ "https://guixpkgs.cachix.org" ];
        extra-trusted-public-keys = [
          "guixpkgs.cachix.org-1:rM4xwCs5NUy+FcCKkiWP/CmRaSVxxDPaKWZvM1bRopg="
        ];
      };
    }
  ];
}
