{
  pkgs,
  ...
}:
{
  home.packages =
    with pkgs;
    (
      [ ]
      ++ (with qt6; [
        qttools
        qtbase
        qtdeclarative
      ])
    );
}
