{ pkgs, ... }: {
  home.packages = with pkgs; [
    tailspin
  ];
}
