{ pkgs, ... }: {
  imports = [
    ./dunst/package.nix
    ./flameshot/package.nix
    ./hypr/package.nix
    ./rofi/package.nix
    ./swayimg/package.nix
    ./swayosd/package.nix
    ./walker/package.nix
    ./waybar/package.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard

    wlogout

    libnotify
    brightnessctl

    # grim
    # slurp

    cliphist
    playerctl
    swayosd

    pavucontrol
    networkmanagerapplet
  ];
}
