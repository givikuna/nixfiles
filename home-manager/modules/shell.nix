{ pkgs, ... }:
{
  imports = [
    ../packages/configurations/shell/fish/package.nix
    ../packages/configurations/shell/nushell/package.nix
    ../packages/configurations/shell/zsh/package.nix
    ../packages/configurations/shell/elvish/package.nix

    ../packages/configurations/shell/starship/package.nix
    ../packages/configurations/shell/fastfetch/package.nix
    ../packages/configurations/shell/tmux/package.nix
    ../packages/configurations/shell/wezterm/package.nix
    ../packages/configurations/shell/yazi/package.nix
    ../packages/configurations/shell/gitboy/package.nix
    ../packages/configurations/shell/nushell/package.nix

    ../packages/configurations/shell/nix-index/package.nix
    ../packages/configurations/shell/nh/package.nix

    ../packages/configurations/tools/git/package.nix
  ];

  home.packages = with pkgs; [
    superfile
    comma

    libsecret
  ];
}
