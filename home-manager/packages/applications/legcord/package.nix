{
  pkgs,
  lib,
  config,
  ...
}:
lib.mkIf config.my.apps.legcord {
  home.packages = with pkgs; [
    legcord
  ];

  xdg.configFile."legcord/gruvbox.css".source = ../../../../dotfiles/legcord/gruvbox.css;
}
