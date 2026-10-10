{ inputs, ... }:
{
  hostname,
  username ? "givik",
  system ? "x86_64-linux",
  version ? "unknown",
}:
let
  host-grps =
    let
      lib = inputs.nixpkgs.lib;
      group-defs = import ../../groups/default.nix;
    in
    let
      grp-attrs = builtins.attrNames group-defs;
      grp-fn = group: builtins.elem hostname group-defs.${group};
    in
    lib.genAttrs grp-attrs grp-fn;
in
inputs.nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit
      inputs
      username
      version
      hostname
      ;
    groups = host-grps;
  };
  system = system;

  modules = [
    # ============================================
    #                     SYSTEM
    # ============================================

    # configuration.nix per host
    ../../hosts/${hostname}/configuration.nix

    {
      system.nixos.label = "seraphim-${version}";

      environment.etc."seraphim-version".text = version;
    }

    #

    #

    #

    #

    #

    # ============================================
    #               HOME MANAGER
    # ============================================

    # home-manager
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        backupFileExtension = "backup";

        extraSpecialArgs = {
          inherit inputs username hostname;
          host-name = hostname;
          groups = host-grps;
        };

        users.${username} = import ../../home-manager/hosts/${hostname}.nix;
      };
    }

    #

    #

    #

    #

    #

    # ============================================
    #                  FLATPAKS
    # ============================================

    # flatpaks
    inputs.nix-flatpak.nixosModules.nix-flatpak

    # home manager
    {
      home-manager.sharedModules = [
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
      ];
    }

    #

    #

    #

    #

    #

    # ============================================
    #               CHAOTIC NYX
    # ============================================

    inputs.chaotic.nixosModules.default

    #

    #

    #

    #

    #

    # ============================================
    #               SECRETS
    # ============================================

    inputs.agenix.nixosModules.default

    inputs.ynternals.nixosModules.default

    #

    #

    #

    #

    #

    # ============================================
    #               CONSTANTS
    # ============================================

    inputs.nixtants.nixosModules.default

    ../../nixtants

    {
      home-manager.sharedModules = [
        inputs.nixtants.homeModules.default
        ../../nixtants
      ];
    }

    #

    #

    #

    #

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

    #

    #

    #

    #

    #

    # ============================================
    #                  Determinate
    # ============================================

    # inputs.determinate.nixosModules.default

    #

    #

    #

    #

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

    #

    #

    #

    #

    # ============================================
    #                   GAMING
    # ============================================

    inputs.nix-gaming.nixosModules.platformOptimizations
    inputs.nix-gaming.nixosModules.wine
    inputs.nix-gaming.nixosModules.pipewireLowLatency

    #

    #

    #

    #

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
  ];
}
