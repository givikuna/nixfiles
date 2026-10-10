{
  inputs,
  nixtants,
  username,
  ...
}:
{
  imports = [
    ../server-common.nix
    ./hardware-configuration.nix

    ./modules/system.nix
    # ./modules/nebula.nix
    ./modules/nginx.nix

    inputs.disko.nixosModules.disko
    ./modules/disko.nix
  ];

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  fileSystems."/" = {
    device = "/dev/nvme0n1";
    fsType = "ext4";
  };

  networking.hostName = nixtants.hosts.orion.name;

  powerManagement.cpuFreqGovernor = "ondemand";
  # services.tlp.enable = true;
  services.power-profiles-daemon.enable = true;

  # sudo wipefs -a [location]
}
