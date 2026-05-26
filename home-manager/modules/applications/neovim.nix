{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim

    vimPlugins.eyeliner-nvim
  ];

  xdg.configFile."nvim" = {
    source = ../../../dotfiles/nvim/init.lua;
    force = true;
  };
}
