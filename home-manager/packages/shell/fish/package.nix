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

      # system shorthands
      rnnr = "rebuild-system && reboot";
      r = "rebuild-system";
      u = "rebuild-system && update-system && rebuild-system";
      syu = "u";
      edits = "edit-system";

      # eza shorthands
      e = "eza --hyperlink --icons";
      e1 = "e -1";
      etree = "eza --tree --icons";
      ebs = "eza --icons --absolute --hyperlink";
      ebs1 = "ebs -1";
      ezasnew = "eza -snew";
      ezasnew1 = "ezasnew 1";

      # l
      l = "e";
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
