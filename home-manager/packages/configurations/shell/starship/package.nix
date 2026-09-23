{ ... }:
{
  programs.starship = {
    enable = true;

    enableNushellIntegration = true;
  };

  xdg.configFile."starship.toml".source = ../../../../../dotfiles/starship/starship.toml;
}
