{
  ekapkgs,
  groups,
  pkgs,
  ...
}:
{
  home.packages =
    (with pkgs; [
      gnumake
      cmake

      ninja
    ])
    ++ (with (if groups.ekapkgers then ekapkgs else pkgs); [
      cmake-language-server
    ]);
}
