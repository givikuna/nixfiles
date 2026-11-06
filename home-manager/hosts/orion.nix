{ pkgs, ... }:
{
  imports = [
    ../common.nix

    ./apps/minotaur.nix
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

    # kdePackages.kate
  ];

  services.flatpak.packages = [
    # personal
    "tech.dongdongbh.mindwtr"
    "md.obsidian.Obsidian"

    # reader
    "com.github.johnfactotum.Foliate"
  ];
}
