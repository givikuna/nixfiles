{
  lib,
  config,
  pkgs,
  ...
}:
lib.mkIf config.my.apps.kitty {
  home.packages = with pkgs; [
    kitty
  ];

  xdg.configFile."kitty/kitty.conf".source = ../../../../dotfiles/kitty/kitty.conf;
}
