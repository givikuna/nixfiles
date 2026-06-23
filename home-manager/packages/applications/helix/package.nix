{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    helix
  ];

  xdg.configFile."helix/config.toml" = {
    source = ../../../../dotfiles/helix/config.toml;
  };
}
