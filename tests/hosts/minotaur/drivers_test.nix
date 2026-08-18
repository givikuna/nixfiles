{ nixosConfigurations, ... }:

{
  suites."Minotaur: Hardware & Drivers" = {
    pos = __curPos;
    tests = [
      {
        name = "nvidia-modesetting-is-enabled";
        type = "unit";
        expected = true;
        actual = nixosConfigurations.minotaur.config.hardware.nvidia.modesetting.enable;
      }
      {
        name = "cachyos-driver-package-is-selected";
        type = "unit";
        expected = true;
        actual = nixosConfigurations.minotaur.config.custom.kernel.drivers.nvidia_cachyos.enable;
      }
    ];
  };
}
