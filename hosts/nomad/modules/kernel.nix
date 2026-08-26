{ ... }: {
  imports = [
    ../../_modules/kernel/default.nix
  ];

  custom.kernel = {
    boot = {
      packages = {
        kernel-variant = {
          cachyos-hardened-kernel.enable = true;
        };
      };

      sysctl.profiles.gaming-minotaur.enable = true;
    };

    services.scx = {
      enable = true;
      scheduler = {
        bpfland.enable = true;
      };
    };
  };
}
