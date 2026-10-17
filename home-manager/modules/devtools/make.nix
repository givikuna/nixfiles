{
  ekapkgs,
  groups,
  pkgs,
  ...
}:
{
  home.packages =
    (with pkgs; [
      cmake-language-server
    ])
    ++ (with (if groups.ekapkgers then ekapkgs else pkgs); [
      gnumake
      cmake
      ninja
    ]);
}
