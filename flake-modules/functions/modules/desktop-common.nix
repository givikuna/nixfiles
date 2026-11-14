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
    #               PLASMA MANAGER
    # ============================================

    {
      home-manager.sharedModules = [
        inputs.plasma-manager.homeModules.plasma-manager
      ];
    }
  ]
  ++ lib.optionals groups.nix-gamers [
    #

    # ============================================
    #                   GAMING
    # ============================================

    inputs.nix-gaming.nixosModules.platformOptimizations
    inputs.nix-gaming.nixosModules.wine
    inputs.nix-gaming.nixosModules.pipewireLowLatency
  ]
  ++ lib.optionals groups.ryokuers [
    #

    # ============================================
    #                   RYOKU
    # ============================================

    inputs.ryoku.nixosModules.default
  ]
  ++ lib.optionals groups.flatpakkers [
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
  ];
}
