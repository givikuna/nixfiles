{ pkgs, ... }: {
  home.packages = with pkgs; [
    fet-sh
  ];
}
