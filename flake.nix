{
  description = "all hail richard stallman";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak";
    };

    gonwatch = {
      url = "github:kbwhodat/gonwatch/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rip = {
      url = "github:cesarferreira/rip";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      url = "github:FlameFlag/nixcord";
    };

    gitboy = {
      url = "github:givikuna/gitboy";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-flatpak,
      sops-nix,
      # hyprland-virtual-desktops,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        minotaur = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/minotaur/configuration.nix
            nix-flatpak.nixosModules.nix-flatpak
            sops-nix.nixosModules.sops
            home-manager.nixosModules.home-manager
            # {
            #   wayland.windowManager.hyprland = {
            #     enable = true;
            #     plugins = [
            #       hyprland-virtual-desktops.packages.${nixpkgs.legacyPackages.${"x86_64-linux"}.system}
            #     ];
            #   };
            # }
            (
              { config, ... }:
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.backupFileExtension = "backup";
                home-manager.extraSpecialArgs = {
                  inherit inputs;
                  host-name = config.networking.hostName;
                };
                home-manager.sharedModules = [
                  nix-flatpak.homeManagerModules.nix-flatpak
                  sops-nix.homeManagerModules.sops
                ];
                home-manager.users.givik = import ./home-manager/hosts/minotaur.nix;
              }
            )
          ];
        };

        nomad = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/nomad/configuration.nix
            nix-flatpak.nixosModules.nix-flatpak
            sops-nix.nixosModules.sops
            home-manager.nixosModules.home-manager
            (
              { config, ... }:
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.backupFileExtension = "backup";
                home-manager.extraSpecialArgs = {
                  inherit inputs;
                  host-name = config.networking.hostName;
                };
                home-manager.sharedModules = [
                  nix-flatpak.homeManagerModules.nix-flatpak
                  sops-nix.homeManagerModules.sops
                ];
                home-manager.users.givik = import ./home-manager/hosts/nomad.nix;
              }
            )
          ];
        };

        pilgrim = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/pilgrim/configuration.nix
            (
              { config, ... }:
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.backupFileExtension = "backup";
                home-manager.extraSpecialArgs = {
                  inherit inputs;
                  host-name = config.networking.hostName;
                };
                home-manager.sharedModules = [ ];
                home-manager.users.givik = import ./home-manager/hosts/pilgrim.nix;
              }
            )
          ];
        };
      };
    };
}
