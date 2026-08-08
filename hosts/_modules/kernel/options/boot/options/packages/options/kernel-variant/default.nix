{
  config,
  lib,
  pkgs,
  ...
}:

let
  variants = import ./variants.nix { inherit pkgs; };

  variantOpts = lib.mapAttrs (name: pkg: {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Whether to use the ${name} kernel variant.";
    };
    package = lib.mkOption {
      type = lib.types.package;
      readOnly = true;
      description = "The kernel package for this variant.";
      default = pkg;
    };
  }) variants;

in
{
  options.custom.kernel.boot.packages.kernel-variant = variantOpts;

  config =
    let
      enabled = lib.filter (name: config.custom.kernel.boot.packages.kernel-variant.${name}.enable) (
        lib.attrNames variants
      );
      count = lib.length enabled;
    in
    {
      assertions = [
        {
          assertion = count <= 1;
          message = "Only one kernel variant can be enabled at a time.";
        }
      ];

      boot.kernelPackages = lib.mkIf (count == 1) (lib.mkDefault (variants.${lib.head enabled}));
    };
}
