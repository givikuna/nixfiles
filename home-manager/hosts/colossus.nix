{ pkgs, ... }:
{
  imports = [
    ../common.nix

    ../modules/desktop/hyprgruvbox/desktop.nix

    ./apps/colossus.nix
  ];

  home.packages = with pkgs; [
    # personal
    planify
    calibre

    # capturing
    gimp
    imagemagick
    switcheroo
    obs-studio
  ];

  services.flatpak.packages = [
    # personal
    "tech.dongdongbh.mindwtr"
    "md.obsidian.Obsidian"

    # reader
    "com.github.johnfactotum.Foliate"
  ];
}
