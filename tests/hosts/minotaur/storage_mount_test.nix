{ nixosConfigurations, ... }:
let
  cfg = nixosConfigurations.minotaur.config;
in
{
  suites."Minotaur: Storage & Mounts" = {
    pos = __curPos;
    tests = [
      {
        name = "storage-mount-options-include-nofail";
        type = "unit";
        expected = true;
        actual = builtins.elem "nofail" cfg.fileSystems."/home/givik/Storage".options;
      }
      # {
      #   name = "vm-storage-services-active";
      #   type = "vm";
      #   vmConfig = {
      #     nodes.machine = {
      #       imports = [
      #         ../../../hosts/_modules/system/sys-cleanup.nix
      #         ../../../hosts/_modules/system/boot.nix
      #       ];
      #       services.udisks2.enable = true;
      #       services.gvfs.enable = true;
      #     };
      #     testScript = builtins.readFile ./scripts/test-storage-mounts.py;
      #   };
      # }
    ];
  };
}
