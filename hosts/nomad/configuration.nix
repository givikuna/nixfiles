{ ... }:
{
  imports = [
    ../common.nix
    ./hardware-configuration.nix

    ../_modules/desktops/hyprland.nix

    ../_modules/sec/tor.nix
    ../_modules/sec/firejail.nix
    ../_modules/sec/protonvpn.nix

    ../_modules/misc/boxes.nix

    ./modules/mod.nix
  ];

  networking.hostName = "nomad";

  # ram overload
  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16384;
    }
  ];

  services.tlp.enable = false;
  services.power-profiles-daemon.enable = true;

  powerManagement.cpuFreqGovernor = "balanced";
}
