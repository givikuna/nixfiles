{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
  ];

  programs.bat.extraPackages = with pkgs.bat-extras; [
    batdiff
    batgrep
    batman
    batwatch
  ];
}
