{ ... }:
{
  imports = [
    ./modules/gaming-optimization.nix
    ./modules/session-variables.nix

    # ../../_modules/kernel/default.nix
    ../../_modules/daemons/default.nix
  ];

  # forces nix-gaming's value for this to be dropped
  # boot.kernel.sysctl."kernel.split_lock_mitigate" = lib.mkForce 0;

  ysyldur = {
    boot = {
      packages.variant = "zen";

      params = {
        split_lock_detect = "off";
      };

      sysctl.profiles.gaming-minotaur.enable = true;
    };

    drivers = {
      # nvidia_cachyos.enable = true;
      nvidia_stable.enable = true;

      xpadneo.enable = true;
    };

    services.scx = {
      enable = true;

      scheduler = {
        bpfland.enable = true;
      };
    };
  };

  /*
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

        sysctl.profiles.gaming-minotaur.enable = true;
      };

      drivers = {
        # system
        nvidia_cachyos.enable = true;
        nvidia_stable.enable = false; # cause fuck stability

        # peripherals
        xpadneo.enable = true;
      };

      services.scx = {
        enable = true;
        scheduler = {
          bpfland.enable = true;
        };
      };
    };
  */

  custom.daemons = {
    razer.enable = true;

    ananicy-cpp.enable = true;

    power-profiles.enable = true;
  };
}
