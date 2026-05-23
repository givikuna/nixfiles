{ pkgs, ... }:
{
  imports = [
    ./desktop/flameshot.nix
    ./desktop/dunst.nix
    ./desktop/hypr.nix
    ./desktop/rofi.nix
    ./desktop/walker.nix
    ./desktop/waybar.nix
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

    haruna
  ];

  services.swayosd.enable = true;
}
