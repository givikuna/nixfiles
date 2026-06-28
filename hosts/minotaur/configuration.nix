{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../common.nix

    ../_modules/desktops/hyprland.nix

    ../_modules/system/gaming-optimizations.nix

    ../_modules/misc/boxes.nix
    ../_modules/misc/steam-config.nix
    ../_modules/misc/retroarch.nix
    ../_modules/misc/protonvpn.nix
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

  environment.systemPackages = with pkgs; [
    gruvbox-kvantum
  ];

  environment.sessionVariables = {
    __GL_SHADER_DISK_CACHE_SKIP_CLEANUP = "1";
    __GL_SHADER_DISK_CACHE_SIZE = "100000000000";
    GTK_THEME = "Gruvbox-Dark-B:dark";
  };

  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483642;
    "vm.swappiness" = 10;
  };

  services.scx = {
    enable = true;
    scheduler = "scx_bpfland"; # better than scx_lavd for gaming afaik
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
