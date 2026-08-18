{
  pkgs,
  ntlib,
  nixosConfigurations,
  ...
}:
let
  cfg = nixosConfigurations.minotaur.config;
in
{
  suites."Minotaur: Kernel  Tuning" = {
    pos = __curPos;
    tests = [
      {
        name = "cachyos-lts-kernel-variant-enabled";
        type = "unit";
        expected = true;
        actual = cfg.custom.kernel.boot.packages.kernel-variant.cachyos-lts-kernel.enable;
      }
      {
        name = "bpfland-scheduler-enabled";
        type = "unit";
        expected = true;
        actual = cfg.custom.kernel.services.scx.scheduler.bpfland.enable;
      }
      {
        name = "gaming-sysctl-profile-active";
        type = "unit";
        expected = true;
        actual = cfg.custom.kernel.boot.sysctl.profiles.gaming-minotaur.enable;
      }
      {
        name = "validate-kernel-parameters-script";
        type = "script";
        script = ''
          ${ntlib.helpers.path (
            with pkgs;
            [
              gnugrep
              coreutils
            ]
          )}
          ${ntlib.helpers.scriptHelpers}

          export KERNEL_PARAMS="${builtins.concatStringsSep " " cfg.boot.kernelParams}"
          export CPU_GOVERNOR="${cfg.powerManagement.cpuFreqGovernor}"

          ${builtins.readFile ./scripts/verify-kernel-params.sh}
        '';
      }
    ];
  };
}
