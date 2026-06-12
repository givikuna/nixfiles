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
}
