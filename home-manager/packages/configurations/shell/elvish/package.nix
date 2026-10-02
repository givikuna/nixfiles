{ pkgs, ... }: {
  home.packages = with pkgs; [
    elvish
  ];
}
