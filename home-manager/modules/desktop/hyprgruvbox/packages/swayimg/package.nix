{ pkgs, ... }: {
  home.packages = with pkgs; [
    swayimg
  ];

  xdg.configFile."swayimg/init.lua".source = ../../../../../../dotfiles/swayimg/init.lua;
}
