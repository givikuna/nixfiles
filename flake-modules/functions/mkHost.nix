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
    # ============================================
    #                     SYSTEM
    # ============================================

    # configuration.nix per host
    ../../hosts/${hostname}/configuration.nix

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
          inherit inputs username;
          host-name = hostname;
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
    #                      AI
    # ============================================

    inputs.nixified-ai.nixosModules.comfyui

    {
      disabledModules = [ "services/misc/comfyui.nix" ];
    }

    # cuda cache for ollama
    {
      nix.settings = {
        substituters = [ "https://cachix.org" ];
        trusted-public-keys = [
          "cuda-maintainers.cachix.org-1:0f67Xm9Z6sS9dgy6q8O7r6Vms8+V+T8O07N/8892g3I="
        ];
      };
    }

    # nixified ai cache
    {
      nix.settings = {
        trusted-substituters = [
          "https://ai.cachix.org/"
        ];

        trusted-public-keys = [
          "ai.cachix.org-1:N9dzRK+alWwoKXQlnn0H6aUx0lU/mspIoz8hMvGvbbc="
        ];
      };
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
    #                MULTIVERSE
    # ============================================

    inputs.multiverse.nixosModules.default

    # home manager
    {
      home-manager.sharedModules = [
        inputs.multiverse.homeManagerModules.default
      ];
    }
  ];
}
