{ pkgs, ... }:
{
  programs.fish.enable = true;
  programs.zsh.enable = true;
  environment.shells = with pkgs; [
    fish
    zsh
    bash
    nushell
  ];

  users.users.givik.shell = pkgs.fish;
}
