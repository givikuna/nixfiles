{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zoxide
  ];

  programs.zoxide.enableBashIntegration = true;
  programs.zoxide.enableFishIntegration = true;
  programs.zoxide.enableNushellIntegration = true;
  programs.zoxide.enableZshIntegration = true;
}
