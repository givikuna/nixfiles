{ pkgs, ... }: {
  home.packages = with pkgs; [
    himalaya
  ];
}
