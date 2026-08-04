{ pkgs, ... }:
{
  programs.fish = {
    interactiveShellInit = ''
      set -g fish_greeting

      #if not set -q TMUX
      #  tmux attach-session -t default 2>/dev/null; or tmux new-session -s default
      #end
    '';

    shellAliases = {
      # system shorthands
      rnnr = "rebuild-system && reboot";
      rnnp = "rebuild-system && poweroff";
      r = "rebuild-system";
      u = "rebuild-system && update-system && rebuild-system";
      rur = "r && u && r";
      unnr = "u && reboot";
      syu = "u";
      edits = "edit-system";
      pushs = "push-system";
      rebp = "r && pushs";
      updp = "u && pushs";
      mvpls = "move-please";

      # eza shorthands
      e = "eza --hyperlink --icons";
      e1 = "e -1";
      etree = "eza --tree --icons";
      ebs = "eza --icons --absolute --hyperlink";
      ebs1 = "ebs -1";
      ezasnew = "eza -snew";
      ezasnew1 = "ezasnew -1";

      # l
      l = "e";

      # aliases
      gitingest = "repomix";
      speedtest = "speedtest-cli";

      # power profiles
      set-balanced = "powerprofilesctl set balanced";
      set-performance = "powerprofilesctl set performance";
      set-power-saver = "powerprofilesctl set power-saver";
      get-power-profile = "powerprofilesctl get";
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
