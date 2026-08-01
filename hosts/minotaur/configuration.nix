{ config, ... }:
{
  imports = [
    ../common.nix
    ./hardware-configuration.nix

    ./modules/desktop.nix
    ./modules/misc.nix
    ./modules/system.nix

    ../_modules/desktops/hyprland.nix

    ../_modules/sec/tor.nix
    ../_modules/sec/firejail.nix
    ../_modules/sec/protonvpn.nix

    ../_modules/licenses/android_sdk.nix

    ../_modules/misc/boxes.nix
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

  # forces high-performance energy state
  powerManagement.cpuFreqGovernor = "performance";

  # nvidia driver stuff
  # if copying my system I would change the stuff here
  # this will not work on everyone's computers
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      /*
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
      */

      sync.enable = true;

      # run `lspci | grep -E "VGA|3D"`
      # this is to verify the addresses
      intelBusId = "PCI:00:02:0";
      nvidiaBusId = "PCI:01:00:0";
    };
  };

  services.tlp.enable = false; # bad for battery life
  # avoids insufficient power being given

  services.power-profiles-daemon.enable = true;

  # gamemoderun mangohud %command%
  # in steam
  # put this in steam game properties for launch options
  # also launch applications like davinci with nvidia-offload
}
