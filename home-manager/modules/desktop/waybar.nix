{ pkgs, ... }:
{
  home.packages = with pkgs; [
    waybar
  ];

  xdg.configFile."waybar/config".source = ../../../dotfiles/waybar/config.json;
  xdg.configFile."waybar/style.css".source = ../../../dotfiles/waybar/style.css;
}
