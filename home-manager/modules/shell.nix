{ pkgs, ... }:
{
  imports = [
    ./shell/fish.nix
    ./shell/starship.nix
    ./shell/fastfetch.nix
    ./shell/tmux.nix
    ./shell/yazi.nix
  ];

  home.packages = with pkgs; [
    superfile
    nushell
    comma

    libsecret
  ];

  programs.fish.enable = true;
  programs.zsh.enable = true;
  programs.nushell.enable = true;

  programs.nix-index.enable = true; # for comma
}
