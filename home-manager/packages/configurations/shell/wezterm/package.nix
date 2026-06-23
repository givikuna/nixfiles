{ ... }:
{
  programs.wezterm = {
    enable = true;
    #enableBashIntegration = true;
    # enableFishIntegration = true;
    #enableNushellIntegration = true;
    #enableZshIntegration = true;
  };

  xdg.configFile."wezterm/wezterm.lua".source = ../../../../../dotfiles/wezterm/wezterm.lua;
}
