{
  pkgs,
  lib,
  config,
  ...
}:
lib.mkIf config.my.apps.discord {
  home.packages = with pkgs; [
    discord-canary
  ];
}
