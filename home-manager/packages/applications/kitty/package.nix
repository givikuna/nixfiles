{
  lib,
  config,
  pkgs,
  host-name,
  ...
}:
lib.mkIf config.my.apps.kitty {
  home.packages = with pkgs; [
    kitty
  ];

  xdg.configFile."kitty/kitty.conf".source = ../../../../dotfiles/kitty/${host-name}/kitty.conf;
}
