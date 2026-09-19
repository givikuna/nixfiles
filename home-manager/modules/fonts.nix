{ ... }: {
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [ "Roboto Mono" ];
      sansSerif = [ "Roboto Mono" ];
      serif = [ "Roboto Mono" ];
    };
  };

  xdg.configFile."fontconfig/fonts.conf".source = ../../dotfiles/fontconfig/fonts.conf;
}
