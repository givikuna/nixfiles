{ ... }:
{
  imports = [
    ./modules/cli-tools.nix
    ./modules/shell.nix
  ];

  home.username = "givik";
  home.homeDirectory = "/home/givik";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
