{ ... }:
{
  imports = [
    ./modules/apps.nix
    ./modules/cli-tools.nix
    ./modules/desktop.nix
    ./modules/dev-tools.nix
    ./modules/editors.nix
    ./modules/shell.nix
    ./modules/media-streamers.nix
  ];

  home.username = "givik";
  home.homeDirectory = "/home/givik";
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
