{ pkgs, ... }:
{
  home.packages = with pkgs; [
    protonup-qt
    mangohud
  ];

  services.flatpak.packages = [
    "com.heroicgameslauncher.hgl"
    "net.lutris.Lutris"
    "ro.go.hmlendea.SokoGrump"
    "com.endlessnetwork.aqueducts"
    "sh.ppy.osu"
  ];
}
