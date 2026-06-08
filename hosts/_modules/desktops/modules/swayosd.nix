{ pkgs, ... }:
{
  # gives swayosd rights
  services.udev.packages = [ pkgs.swayosd ];
}
