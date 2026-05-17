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

    functions = {
      switch-shell = {
        body = ''
          set -l chosen (echo -e "nushell\nzsh\nbash\nfish" | fzf --height=6 --border --prompt="🚀 Switch environment to: ")
          switch "$chosen"
              case nushell; nu
              case zsh; zsh
              case bash; bash
              case fish; fish
          end
        ''
      };
    };
  };

  programs.zsh.enable = true;
  programs.nushell.enable = true;

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
    fastfetch
    nushell
  ];

  xdg.configFile."kitty/kitty.conf".source = ../../dotfiles/kitty/kitty.conf;

  xdg.configFile."starship.toml".source = ../../dotfiles/starship/starship.toml;

  xdg.configFile."yazi/yazi.toml".source = ../../dotfiles/yazi/yazi.toml;
  xdg.configFile."yazi/keymap.toml".source = ../../dotfiles/yazi/keymap.toml;
  xdg.configFile."yazi/theme.toml".source = ../../dotfiles/yazi/theme.toml;

  xdg.configFile."fastfetch/config.jsonc".source = ../../dotfiles/fastfetch/config.jsonc;
}
