{
  pkgs,
  lib,
  config,
  ...
}:
lib.mkIf config.my.apps.micro {
  home.packages = with pkgs; [
    micro
  ];

  xdg.configFile."micro/settings.json" = {
    source = ../../../../dotfiles/micro/settings.json;
  };
}
