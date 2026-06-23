{ ... }:
{
  programs.starship.enable = true;

  xdg.configFile."starship.toml".source = ../../../../../dotfiles/starship/starship.toml;
}
