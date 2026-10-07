{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    optnix
  ];
}
