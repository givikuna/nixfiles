{ pkgs, ... }: {
  programs.fish = {
    enable = true;

    shellAliases = {
      update-system = "python3 /etc/nixos/scripts/rebuild.py";
      edit-system  = "python3 /etc/nixos/scripts/edit.py";
      l = "eza --icons";
    };

    plugins = [
      {
        name = "z";
        src = pkgs.fishPlugins.z.src;
      }
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
    ];

    # interactiveShellInit = ''
    #  starship init fish | source
    # '';
  };

  programs.starship.enable = true;

  programs.tmux = {
    enable = true;
    clock24 = true;
    terminal = "screen-256color";
    shortcut = "a";
  };

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.thefuck = {
    enable = true;
    enableFishIntegration = true;
  };

  home.packages = with pkgs; [
    superfile
    kitty
    fzf
  ];

  xdg.configFile."kitty/kitty.conf".source = ../../dotfiles/kitty/kitty.conf;

  xdg.configFile."starship.toml".source = ../../dotfiles/starship/starship.toml;

  xdg.configFile."yazi/yazi.toml".source = ../../dotfiles/yazi/yazi.toml;
  xdg.configFile."yazi/keymap.toml".source = ../../dotfiles/yazi/keymap.toml;
  xdg.configFile."yazi/theme.toml".source = ../../dotfiles/yazi/theme.toml;
}
