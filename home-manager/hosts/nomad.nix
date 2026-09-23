{ pkgs, ... }:
{
  imports = [
    ../common.nix

    ../modules/desktop/hyprgruvbox/desktop.nix

    ./apps/nomad.nix
  ];

  home.packages = with pkgs; [
    # img/vid
    gimp
    imagemagick
    switcheroo
    obs-studio
  ];

  services.flatpak.packages = [
    # personal
    "md.obsidian.Obsidian"

    # reader
    "com.github.johnfactotum.Foliate"
  ];
}
