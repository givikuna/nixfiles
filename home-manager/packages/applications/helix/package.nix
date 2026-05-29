{
  pkgs,
  lib,
  config,
  ...
}:
lib.mkIf config.my.apps.helix {
  home.packages = with pkgs; [
    helix
  ];

  xdg.configFile."helix/config.toml" = {
    source = ../../../../dotfiles/helix/config.toml;
  };
}
