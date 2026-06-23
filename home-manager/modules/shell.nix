{ pkgs, ... }:
{
  imports = [
    ../packages/configurations/shell/fish/package.nix
    ../packages/configurations/shell/starship/package.nix
    ../packages/configurations/shell/fastfetch/package.nix
    ../packages/configurations/shell/tmux/package.nix
    ../packages/configurations/shell/wezterm/package.nix
    ../packages/configurations/shell/yazi/package.nix
    ../packages/configurations/shell/gitboy/package.nix

    ../packages/configurations/tools/git/package.nix
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
