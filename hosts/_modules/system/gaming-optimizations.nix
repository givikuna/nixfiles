{ pkgs, ... }:
{
  # boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.kernelPackages = pkgs.linuxPackages;

  # gaming optimization stuff:

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;

  hardware.xpadneo.enable = true;

  # for managing heat
  services.thermald.enable = true;
}
