{ ... }: {
  imports = [
    ../../../_modules/gaming/apps/retroarch.nix
    ../../../_modules/gaming/apps/steam-config.nix

    ../../../_modules/gaming/system/hardware/optimization/opengl-graphics.nix

    ../../../_modules/gaming/system/programs/gamemode.nix
    ../../../_modules/gaming/system/programs/gamescope.nix

    ../../../_modules/gaming/system/services/thermald.nix
  ];
}
