{ pkgs, ... }: {
  programs.elisa = {
    enable = true;
    package = with pkgs; with kdePackages; elisa;

    appearance = {
      colorScheme = null;

      showNowPlayingBackground = true;
      showProgressOnTaskBar = true;
    };
  };
}
