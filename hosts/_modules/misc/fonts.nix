{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.roboto-mono
    noto-fonts-color-emoji
  ];
}
