{
  pkgs,
  ...
}:
{
  imports = [
    ./modules/sls-steam.nix

    ../../packages/configurations/applications/prismlauncher/package.nix
  ];

  home.packages = with pkgs; [
    protonup-qt
    mangohud
    itch
    lutris
    heroic
  ];

  services.flatpak.packages = [
    "ro.go.hmlendea.SokoGrump"
    "com.endlessnetwork.aqueducts"
    "sh.ppy.osu"
    "com.mojang.Minecraft"
    "org.vinegarhq.Sober"
  ];
}
