{
  pkgs,
  groups,
  lib,
  ...
}:
{
  imports = [
    ../common.nix

    ./apps/pilgrim.nix
  ];

  config = lib.mkMerge [
    {
      home.packages = with pkgs; [
        # personal
        # planify
        calibre

        # capturing
        gimp
        imagemagick
        switcheroo
        obs-studio

        # kdePackages.kate
      ];
    }

    (lib.mkIf groups.flatpakkers {
      services.flatpak.packages = [
        # personal
        "tech.dongdongbh.mindwtr"
        "md.obsidian.Obsidian"

        # reader
        "com.github.johnfactotum.Foliate"
      ];
    })
  ];
}
