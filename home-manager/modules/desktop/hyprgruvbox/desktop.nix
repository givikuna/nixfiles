{ pkgs, ... }:
{
  imports = [
    ./packages/dunst/package.nix
    ./packages/flameshot/package.nix
    ./packages/hypr/package.nix
    ./packages/rofi/package.nix
    ./packages/walker/package.nix
    ./packages/waybar/package.nix
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
