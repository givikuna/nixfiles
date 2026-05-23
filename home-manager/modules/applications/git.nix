{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
  };

  home.packages = with pkgs; [
    lazygit
  ];
}
