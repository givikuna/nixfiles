{
    description = "Givi's Nix Config for Little Korolev";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-communuity/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nix-flatpak.url = "github:gvolpe/nix-flatpak";
    };

    outputs = { self, nixpkgs, home-manager, nix-flatpak, ...}@inputs: {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [
                ./hosts/nixos/configuration.nix
                nix-flatpak.nixosModules.nix-flatpak
                home-manager.nixosModules.home-manager
                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.user = import ./home-manager/home.nix;
                }
            ];
        };
    };
}
