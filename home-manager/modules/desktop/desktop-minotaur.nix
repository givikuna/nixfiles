{ pkgs, ... }:
{
  imports = [
    ../../packages/desktop/dunst/package.nix
    ../../packages/desktop/flameshot/package.nix
    ../../packages/desktop/hypr/package.nix
    ../../packages/desktop/rofi/package.nix
    ../../packages/desktop/walker/package.nix
    ../../packages/desktop/waybar/package.nix
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
