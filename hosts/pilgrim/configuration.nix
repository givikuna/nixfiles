{ nixtants, username, ... }:
{
  imports = [
    ../common.nix
    ./hardware-configuration.nix

    ./modules/desktop.nix
    ./modules/misc.nix
    ./modules/hardware.nix
    ./modules/system.nix

    ../_modules/sec/firejail.nix

    ../_modules/licenses/android_sdk.nix
  ];

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  # fileSystems."/" = {
  #   device = "/dev/nvme0n1";
  #   fsType = "ext4";
  # };

  networking.hostName = nixtants.hosts.pilgrim.name;

  powerManagement.cpuFreqGovernor = "ondemand";
  # services.tlp.enable = true;
  services.power-profiles-daemon.enable = true;

  # sudo wipefs -a [location]
}
