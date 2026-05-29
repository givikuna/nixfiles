{ pkgs, ... }:
{
  programs.fish = {
    interactiveShellInit = "set -g fish_greeting";

    shellAliases = {
      rebuild-system = "python3 /etc/nixos/scripts/rebuild-system.py";
      edit-system = "python3 /etc/nixos/scripts/edit-system.py";
      update-system = "/etc/nixos/scripts/update-system.sh";
      push-system = "/etc/nixos/scripts/push-system.sh";
      pull-system = "/etc/nixos/scripts/pull-system.sh";

      l = "eza --icons";
    };

    plugins = [
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
    ];

    functions = {
      switch-shell = {
        body = ''
          set -l chosen (echo -e "nushell\nzsh\nbash\nfish" | fzf --height=10 --border --prompt="Switch environment to: ")
          switch "$chosen"
              case nushell; nu
              case zsh; zsh
              case bash; bash
              case fish; fish
          end
        '';
      };
    };
  };
}
