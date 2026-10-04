{ ... }:
{
  imports = [
    ../../_modules/kernel/default.nix
    ../../_modules/daemons/default.nix
  ];

  custom.kernel = {
    boot = {
      packages = {
        kernel-variant = {
          cachyos-lts-kernel.enable = true;
        };
      };

      params = {
        split_lock_detect = "off";
      };
    };

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
