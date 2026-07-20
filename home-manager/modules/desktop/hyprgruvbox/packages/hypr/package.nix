{ pkgs, ... }:
{
  home.packages = with pkgs; [
    hyprpaper
    hyprpolkitagent
    hypridle
    hyprsunset
    hyprpicker
  ];

  xdg.configFile = {
    "hypr/hyprland.lua".source = ../../../../../../dotfiles/hypr/hyprland.lua;
    "hypr/monitors.conf".source = ../../../../../../dotfiles/hypr/monitors.conf;

    "hypr/hyprpaper.conf".source = ../../../../../../dotfiles/hypr/hyprpaper.conf;
    "hypr/hypridle.conf".source = ../../../../../../dotfiles/hypr/hypridle.conf;
    "hypr/hyprlock.conf".source = ../../../../../../dotfiles/hypr/hyprlock.conf;
  };
}
