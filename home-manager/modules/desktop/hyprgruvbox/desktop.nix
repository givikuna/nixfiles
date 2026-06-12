{ pkgs, ... }:
{
  imports = [
    ./packages/packages.nix
    ./configs/configs.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard

    wlogout

    libnotify
    brightnessctl
    grim
    slurp

    cliphist
    playerctl
    swayosd

    pavucontrol
    networkmanagerapplet
  ];

  services.swayosd.enable = true;
}
