{
  description = "Config for Little Korolev";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    stylix.url = "github:danth/stylix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak";
      # inputs.nixpkgs.follows = "nixpkgs";
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
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lazyspotify = {
      url = "github:dubeyKartikay/lazyspotify/main";
      flake = false;
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-flatpak,
      stylix,
      sops-nix,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        minotaur = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/minotaur/configuration.nix
            stylix.nixosModules.stylix
            nix-flatpak.nixosModules.nix-flatpak
            sops-nix.nixosModules.sops
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.sharedModules = [
                nix-flatpak.homeManagerModules.nix-flatpak
                sops-nix.homeManagerModules.sops
              ];
              home-manager.users.givik = import ./home-manager/home.nix;
            }
          ];
        };
        nomad = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/nomad/configuration.nix
            stylix.nixosModules.stylix
            nix-flatpak.nixosModules.nix-flatpak
            sops-nix.nixosModules.sops
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.sharedModules = [
                nix-flatpak.homeManagerModules.nix-flatpak
                sops-nix.homeManagerModules.sops
              ];
              home-manager.users.givik = import ./home-manager/home.nix;
            }
          ];
        };
      };
    };
}
