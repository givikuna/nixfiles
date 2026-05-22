{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../modules/boxes.nix
  ];

  networking.hostName = "minotaur";

  environment.systemPackages = with pkgs; [
    davinci-resolve
  ];

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
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
