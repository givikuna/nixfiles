{ ... }:
{
  imports = [
    ../packages/applications/Minecraft/package.nix
  ];

  services.flatpak.packages = [
    "com.heroicgameslauncher.hgl"
    "net.lutris.Lutris"
    "ro.go.hmlendea.SokoGrump"
    "com.endlessnetwork.aqueducts"
    "sh.ppy.osu"
  ];
}
