{ pkgs, ... }:
{
  imports = [
    ./applications/neovim.nix
    ./applications/helix.nix
    ./applications/micro.nix
  ];

  home.packages = with pkgs; [
    vscode
  ];
}
