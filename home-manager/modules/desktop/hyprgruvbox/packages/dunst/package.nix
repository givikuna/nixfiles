{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dunst
  ];

  xdg.configFile."dunst/dunstrc".source = ../../../../../../dotfiles/dunst/dunstrc;
}
