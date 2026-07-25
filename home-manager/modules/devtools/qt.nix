{ pkgs, ... }: {
  home.packages = with pkgs; [
    qt6.qttools
    qt6.qtbase
    qt6.qtdeclarative
  ];
}
