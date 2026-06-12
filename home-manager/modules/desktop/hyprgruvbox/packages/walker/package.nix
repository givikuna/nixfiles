{ pkgs, ... }:
{
  home.packages = with pkgs; [
    walker
    elephant
  ];

  xdg.configFile."walker/config.toml".source = ../../../../../../dotfiles/walker/config.toml;
  xdg.configFile."walker/themes/gruvbox".source = ../../../../../../dotfiles/walker/themes/gruvbox;
}
