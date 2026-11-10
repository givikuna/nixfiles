{ inputs, ... }:
{
  hostname,
  type ? "desktop",
  username ? "givik",
  system ? "x86_64-linux",
  version ? "unknown",
  ekapkgs,
  gvpkgs,
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
      ekapkgs
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

    ./modules/common.nix

    (./modules + "/${type}-common.nix")

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
          ekapkgs = ekapkgs;
          gvpkgs = gvpkgs;
        };

        users.${username} = import ../../home-manager/hosts/${hostname}.nix;
      };
    }
  ];
}
