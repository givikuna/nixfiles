{ pkgs, config, ... }: {
  imports = [
    ./modules/shell.nix
  ];

  home.username = "givik";
  home.homeDirectory = "/home/givik";
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
