{ pkgs, inputs, ... }: {
  home.packages = [
    inputs.gitboy.packages.${pkgs.system}.default
  ];

  xdg.configFile."gitboy/config.toml".source = ../../../../../dotfiles/gitboy/config.toml;
}
