{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    micro-full
  ];

  xdg.configFile."micro/settings.json" = {
    source = ../../../../dotfiles/micro/settings.json;
  };
}
