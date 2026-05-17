{ pkgs, ... }: {
  home.packages = with pkgs; [
    ripgrep
    fd
    eza
    bat
    zoxide

    dust
    broot
    ouch

    bottom
    zenith
    bandwhich

    delta
    tokei
  ];
}
