{ username, ... }:
{
  imports = [
    ./modules/folders.nix

    ./modules/shell.nix
    ./modules/cli-tools.nix
    ./modules/scripts.nix
    ./modules/guix.nix

    ./modules/gtk.nix

    ./modules/cursor.nix
    ./modules/fonts.nix

    ./modules/dev-tools.nix
    ./modules/gamedev.nix
    ./modules/security.nix
  ];

  home.username = username;
  # home.homeDirectory = "/home/${username}";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
