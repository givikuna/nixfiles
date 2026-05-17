{ pkgs, ... }: {
  home.packages = with pkgs; [
    neovim
    micro
    helix
  ];

  xdg.configFile."nvim".source = ../../dotfiles/nvim;
}
