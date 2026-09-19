{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      nerd-fonts.roboto-mono
      noto-fonts-color-emoji
    ];

    fontconfig = {
      enable = true;

      defaultFonts = {
        monospace = [ "Roboto Mono" ];
        sansSerif = [ "Roboto Mono" ];
        serif = [ "Roboto Mono" ];
      };
    };
  };

  # fonts.packages = with pkgs; [
  #   nerd-fonts.roboto-mono
  #   noto-fonts-color-emoji
  # ];
}
