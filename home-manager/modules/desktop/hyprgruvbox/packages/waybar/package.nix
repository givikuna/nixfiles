{ pkgs, ... }:
{
  home.packages = with pkgs; [
    waybar
    socat
  ];

  xdg.configFile = {
    "waybar/config".source = ../../../../../../dotfiles/waybar/config.json;
    "waybar/style.css".source = ../../../../../../dotfiles/waybar/style.css;
  };
}
