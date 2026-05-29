{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../common.nix
  ];

  networking.hostName = "minotaur";

  fileSystems."/home/givik/Storage" = {
    device = "/dev/disk/by-uuid/d3ac3f2e-209b-4269-9d07-7b544c2acb1f";
    fsType = "btrfs";
    options = [
      "nofail"
      "x-systemd.device-timeout=5s"
    ];
  };

  environment.sessionVariables = {
    __GL_SHADER_DISK_CACHE_SKIP_CLEANUP = "1";
    __GL_SHADER_DISK_CACHE_SIZE = "100000000000";
  };

  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483642;
    "vm.swappiness" = 10;
  };

  services.scx = {
    enable = true;
    scheduler = "scx_lavd";
  };

  # forces high-performance energy state
  powerManagement.cpuFreqGovernor = "performance";

  # helps in avoiding stuttering
  boot.kernelParams = [
    "split_lock_detect=off"
  ];

  # automatic process nice-ing
  services.ananicy = {
    enable = true;
    package = pkgs.ananicy-cpp;
    rulesProvider = pkgs.ananicy-rules-cachyos;
  };

  # nvidia driver stuff
  # if copying my system I would change the stuff here
  # this will not work on everyone's computers
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = true;

    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      # run `lspci | grep -E "VGA|3D"`
      # this is to verify the addresses
      intelBusId = "PCI:00:02:0";
      nvidiaBusId = "PCI:01:00:0";
    };
  };

  # gamemoderun mangohud %command%
  # in steam
  # put this in steam game properties for launch options
  # also launch applications like davinci with nvidia-offload
}
