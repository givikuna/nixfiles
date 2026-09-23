{
  config,
  pkgs,
  inputs,
  ...
}:
let
  wyrten =
    let
      mkPersona =
        let
          sbx = inputs.agent-sandbox.lib.${with pkgs; system};
        in
        {
          name,
          domains ? { },
          brain-dirs ? [ ],
          pkg ? (with pkgs; aichat),
          bin-name ? "aichat",
        }:
        with sbx;
        mkSandbox {
          inherit pkg;
          binName = bin-name;
          outName = "sbx-${name}";

          allowedPackages =
            with sbx;
            (
              commonTools
              ++ (with pkgs; [
                curl
                pandoc
              ])
            );

          allowedDomains = domains // {
            "localhost" = "*";
            "127.0.0.1" = "*";
          };

          allowedHostPorts = [ 11434 ];

          roDirs = brain-dirs ++ [
            "${config.home.homeDirectory}/.config/aichat"
          ];

          rwDirs = [ ];

          env = {
            AICHAT_CONFIG_DIR = "${config.home.homeDirectory}/.config/aichat";
          };
        };

      # general
      Kahl-175 = mkPersona {
        name = "Kahl-175";
        domains = {
          "fandom.com" = "*";
          "wikipedia.org" = "*";
        };
        brain-dirs = [
          "$HOME/AIBrain/common"
          "$HOME/AIBrain/Kahl-175"
        ];
      };

      # programming
      Chipper = mkPersona {
        name = "Chipper";
        domains = {
          "github.com" = "*";
          "docs.python.org" = "*";
          "raw.githubusercontent.com" = "*";
        };
        brain-dirs = [
          "$HOME/AIBrain/common"
          "$HOME/AIBrain/Chipper"
        ];
      };

      # physics
      OlvarD = mkPersona {
        name = "OlvarD";
        domains = {
          "ncatlab.org" = "*";
          "mathoverflow.net" = "*";
          "arxiv.org" = "*";
          "wikipedia.org" = "*";
        };
        brain-dirs = [
          "$HOME/AIBrain/common"
          "$HOME/AIBrain/OlvarD"
        ];
      };

      # math
      Horrek = mkPersona {
        name = "Horrek";
        domains = {
          "ncatlab.org" = "*";
          "mathoverflow.net" = "*";
          "arxiv.org" = "*";
          "wikipedia.org" = "*";
          "github.com" = "*";
          "raw.githubusercontent.com" = "*";
        };
        brain-dirs = [
          "$HOME/AIBrain/common"
          "$HOME/AIBrain/Horrek"
        ];
      };

      Debug = mkPersona {
        name = "Debug";
        pkg = pkgs.bashInteractive;
        bin-name = "bash";
        domains = { };
        brain-dirs = [ ];
      };
    in
    with pkgs;
    writeShellScriptBin "wyrten" ''
      if [ -z "$1" ]; then
        echo "usage: wyrten [Kahl-175 | Chipper | OlvarD | Horrek]"
        exit 1
      fi

      MODEL=$1
      shift

      case $MODEL in
        Kahl-175) exec ${Kahl-175}/bin/sbx-Kahl-175 --role Kahl-175 "$@" ;;
        Chipper)  exec ${Chipper}/bin/sbx-Chipper --role Chipper "$@" ;;
        OlvarD)   exec ${OlvarD}/bin/sbx-OlvarD --role OlvarD "$@" ;;
        Horrek)   exec ${Horrek}/bin/sbx-Horrek --role Horrek "$@" ;;
        Debug)    exec ${Debug}/bin/sbx-Debug "$@" ;;
      esac
    '';
in
{
  home.packages = [ wyrten ];

  xdg.configFile = {
    "aichat/config.yaml".source = ../../dotfiles/wyrten/aichat/config.yaml;
    "aichat/roles.yaml".source = ../../dotfiles/wyrten/aichat/roles.yaml;
  };

  home.file."AIBrain".source = ../../dotfiles/wyrten/aibrain;
}
