{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # easyeffects
    nwg-displays
    pwvucontrol
    pavucontrol
  ];
}
