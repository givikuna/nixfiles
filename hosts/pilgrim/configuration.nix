{ ... }:
{
  imports = [
    ../common.nix

    ../_modules/desktops/gnome.nix

    ../_modules/misc/boxes.nix
  ];

  # users.users.${username} = {
  #   isNormalUser = true;
  #   extraGroups = [
  #     "networkmanager"
  #     "wheel"
  #   ];
  # };

  fileSystems."/" = {
    device = "/dev/sda1";
    fsType = "ext4";
  };

  networking.hostName = "pilgrim";
}
