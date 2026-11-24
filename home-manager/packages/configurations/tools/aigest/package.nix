{ pkgs, ... }: {
  home.packages = with pkgs; [
    aigest
  ];
}
