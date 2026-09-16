{ ... }: {
  xdg.configFile."guix/channels.scm".source = ../../guix/channels.scm;
  xdg.configFile."guix/manifest.scm".source = ../../guix/channels.scm;

  # ignoring for now
  # xdg.configFile."guix/home.scm".source = ../../../guix/channels.scm;
}
