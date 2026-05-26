{ pkgs, ... }:
{
  home.packages = with pkgs; [
    micro
  ];

  xdg.configFile."micro/settings.json" = {
    source = ../../../dotfiles/micro/settings.json;
  };
}
