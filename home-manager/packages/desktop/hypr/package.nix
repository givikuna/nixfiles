{ pkgs, host-name, ... }:
{
  home.packages = with pkgs; [
    hyprpaper
    hyprpolkitagent
    hypridle
    hyprsunset
    hyprpicker
  ];

  xdg.configFile."hypr/hyprland.lua".source =
    ../../../../dotfiles/hypr + "/${host-name}/hyprland.lua";
  xdg.configFile."hypr/hyprpaper.conf".source =
    ../../../../dotfiles/hypr + "/${host-name}/hyprpaper.conf";
  xdg.configFile."hypr/hypridle.conf".source =
    ../../../../dotfiles/hypr + "/${host-name}/hypridle.conf";
  xdg.configFile."hypr/hyprlock.conf".source =
    ../../../../dotfiles/hypr + "/${host-name}/hyprlock.conf";
}
