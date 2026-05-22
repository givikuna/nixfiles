{ pkgs, ... }:
{
  virtualisation.libvirtd.enable = true;

  users.users.givik.extraGroups = [ "libvirtd" ];

  environment.systemPackages = with pkgs; [
    gnome-boxes
  ];
}
