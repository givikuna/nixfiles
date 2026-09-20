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
      # sys
      ldevs = "bat /proc/bus/input/devices";

      # nix shorthands
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
      rtest = "r && nix run .#tests";
      rtutrt = "r && rtest && u && rtest && r && rtest";

      # move-please
      mvpls = "move-please";
      mvplse = "mvpls && exit";
      mvplsee = "mvpls && edits && exit";

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
      ssll = "switch-shell";

      # fuck larry
      mulgs = "most-used-langs -u givikuna -R al-go-rithms";
      mulgs-larry = "most-used-langs -u dagworth -R Chronica-Phantastikos";

      # power profiles
      set-balanced = "powerprofilesctl set balanced";
      set-performance = "powerprofilesctl set performance";
      set-power-saver = "powerprofilesctl set power-saver";
      get-power-profile = "powerprofilesctl get";

      # git
      ggraph = "git-graph -d -S -s d -f \"%h %an %ae %s %n\" -w -m simple";
      ggraphh = "git-graph -d -S -s d -f \"%H %an %ae %s %n\" -w -m simple";
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
          set -l chosen (echo -e "nushell\nzsh\nbash\nelvish\nfish" | fzf --height=10 --border --prompt="Switch environment to: ")
          switch "$chosen"
              case nushell; nu
              case zsh; zsh
              case bash; bash
              case elvish; elvish
              case fish; fish
          end
        '';
      };

      proj = {
        body = ''
          command proj $argv
          if test $status -eq 0
            exit
          end
        '';
      };
    };
  };
}
