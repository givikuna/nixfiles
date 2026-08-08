{
  pkgs,
  hostname,
  hostModule,
  inputs,
  username,
  ...
}:
pkgs.testers.nixosTest {
  name = "${hostname}-network-test";
  nodes.machine = { ... }: {
    imports = [
      hostModule
      inputs.nix-flatpak.nixosModules.nix-flatpak
      inputs.sops-nix.nixosModules.sops
      inputs.chaotic.nixosModules.default
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

          users.${username} = import ../../../home-manager/hosts/${hostname}.nix;
        };
      }
    ];
    _module.args = { inherit inputs username; };

    nixpkgs.config = pkgs.lib.mkForce { };
    nixpkgs.overlays = pkgs.lib.mkForce [ ];

    # hardware.nvidia.enabled = pkgs.lib.mkForce false;
    networking.firewall.enable = pkgs.lib.mkForce true;
  };

  testScript = builtins.readFile ./scripts/network-test.py;
}
