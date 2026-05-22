{ pkgs, ... }:
{
  home.packages = with pkgs; [
    protonup-qt
    mangohud
  ];

  services.flatpak.packages = [
    "com.heroicgameslauncher.hgl"
    "net.lutris.Lutris"
  ];
}
