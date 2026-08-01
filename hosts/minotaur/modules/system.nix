{ ... }:
{
  imports = [
    ./modules/gaming-optimization.nix
    ./modules/session-variables.nix

    ../../_modules/kernel/default.nix
  ];

  custom.kernel = {
    boot = {
      packages = {
        kernel-variant.default-kernel.enable = true;
      };

      params = {
        split_lock_detect = "off";
      };

      sysctl.profiles.gaming-minotaur.enable = true;
    };

    drivers.xpadneo.enable = true;

    services.scx = {
      enable = true;
      scheduler.bpfland = {
        enable = true;
      };
    };
  };
}
