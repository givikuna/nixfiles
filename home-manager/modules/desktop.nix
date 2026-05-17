{ pkgs, ... }: {
  home.packages = with pkgs; [
    waybar
    rofi-wayland
    dunst
    hyprpaper
    wl-clipboard
    libnotify
  ];

  xdg.configFile."hypr/hyprland.conf".source = ../../dotfiles/hypr/hyprland.conf;
  xdg.configFile."hypr/hyprpaper.conf".source = ../../dotfiles/hypr/hyprpaper.conf;

  xdg.configFile."waybar/config".source = ../../dotfiles/waybar/config.json;
  xdg.configFile."waybar/style.css".source = ../../dotfiles/waybar/style.css;

  xdg.configFile."rofi/config.rasi".source = ../../dotfiles/rofi/config.rasi;

  xdg.configFile."dunst/dunstrc".source = ../../dotfiles/dunst/dunstrc;
}
