{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vscode
    neovim
    micro
    helix
  ];

  xdg.configFile."nvim".source = ../../dotfiles/nvim;
}
