{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hyprpaper
    hyprpolkitagent
    hypridle
    hyprsunset
    hyprpicker
  ];

  xdg.configFile."hypr/hyprland.lua".source = ../../../dotfiles/hypr/hyprland.lua;
  xdg.configFile."hypr/hyprpaper.conf".source = ../../../dotfiles/hypr/hyprpaper.conf;
  xdg.configFile."hypr/hypridle.conf".source = ../../../dotfiles/hypr/hypridle.conf;
  xdg.configFile."hypr/hyprlock.conf".source = ../../../dotfiles/hypr/hyprlock.conf;
}
