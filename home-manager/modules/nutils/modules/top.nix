{ pkgs, ... }: {
  home.packages = with pkgs; [
    gtop
    bottom
  ];
}
