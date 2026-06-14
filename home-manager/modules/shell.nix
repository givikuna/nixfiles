{ pkgs, ... }:
{
  imports = [
    ../packages/shell/fish/package.nix
    ../packages/shell/starship/package.nix
    ../packages/shell/fastfetch/package.nix
    ../packages/shell/tmux/package.nix
    ../packages/shell/wezterm/package.nix
    ../packages/shell/yazi/package.nix
    ../packages/shell/gitboy/package.nix

    ../packages/tools/git/package.nix
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
