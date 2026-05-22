{ pkgs, ... }:
{
  imports = [
    ./applications/flameshot.nix
  ];

  home.packages = with pkgs; [
    waybar
    wl-clipboard
    # rofi
    walker
    elephant

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
    flameshot

    cliphist
    playerctl
    swayosd

    pavucontrol
    networkmanagerapplet

    haruna
  ];

  services.swayosd.enable = true;

  xdg.configFile."hypr/hyprland.lua".source = ../../dotfiles/hypr/hyprland.lua;
  xdg.configFile."hypr/hyprpaper.conf".source = ../../dotfiles/hypr/hyprpaper.conf;
  xdg.configFile."hypr/hypridle.conf".source = ../../dotfiles/hypr/hypridle.conf;
  xdg.configFile."hypr/hyprlock.conf".source = ../../dotfiles/hypr/hyprlock.conf;

  xdg.configFile."waybar/config".source = ../../dotfiles/waybar/config.json;
  xdg.configFile."waybar/style.css".source = ../../dotfiles/waybar/style.css;

  #xdg.configFile."rofi/config.rasi".source = ../../dotfiles/rofi/config.rasi;
  xdg.configFile."walker/config.toml".source = ../../dotfiles/walker/config.toml;
  xdg.configFile."walker/themes/gruvbox".source = ../../dotfiles/walker/themes/gruvbox;

  xdg.configFile."dunst/dunstrc".source = ../../dotfiles/dunst/dunstrc;
}
