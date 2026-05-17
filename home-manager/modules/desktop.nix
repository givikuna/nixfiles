{ pkgs, ... }: {
  home.packages = with pkgs; [
    waybar
    wl-clipboard
    rofi-wayland

    dunst

    hyprpaper
    hyprpolkitagent
    hypridle
    hyprsunset
    hyprpicker

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

  xdg.configFile."hypr/hyprland.conf".source = ../../dotfiles/hypr/hyprland.conf;
  xdg.configFile."hypr/hyprpaper.conf".source = ../../dotfiles/hypr/hyprpaper.conf;
  xdg.configFile."hypr/hypridle.conf".source = ../../dotfiles/hypr/hypridle.conf;
  xdg.configFile."hypr/hyprlock.conf".source = ../../dotfiles/hypr/hyprlock.conf;

  xdg.configFile."waybar/config".source = ../../dotfiles/waybar/config.json;
  xdg.configFile."waybar/style.css".source = ../../dotfiles/waybar/style.css;

  xdg.configFile."rofi/config.rasi".source = ../../dotfiles/rofi/config.rasi;

  xdg.configFile."dunst/dunstrc".source = ../../dotfiles/dunst/dunstrc;
}
