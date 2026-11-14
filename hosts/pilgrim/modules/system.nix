{ ... }:
{
  imports = [
    ../../_modules/kernel/default.nix
    ../../_modules/daemons/default.nix
  ];

  ysyldur = {
    boot = {
      packages.variant = "default";

      params = {
        split_lock_detect = "off";
      };
    };

    drivers = { };

    services.scx = {
      enable = true;

      scheduler = {
        bpfland.enable = true;
      };
    };
  };

  custom.daemons = {
    razer.enable = true;

    ananicy-cpp.enable = true;

    power-profiles.enable = true;
  };
}
