{ ... }:
{
  imports = [
    ./modules/apps.nix
    ./modules/cli-tools.nix
    ./modules/desktop.nix
    ./modules/dev-tools.nix
    ./modules/shell.nix
    ./modules/theme.nix
    ./modules/distrobox.nix
  ];

  home.username = "givik";
  home.homeDirectory = "/home/givik";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
