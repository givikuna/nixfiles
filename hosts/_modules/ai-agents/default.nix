{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.custom.ai;
  modelsList = lib.attrValues cfg.models;

  syncScript = pkgs.writeShellScriptBin "ollama-sync" ''
    export MODELS="${lib.escapeShellArgs modelsList}"
    export REMOVE_EXTRAS="${if cfg.removeExtras then "true" else "false"}"
    exec ${pkgs.bash}/bin/bash ${../../../scripts/nonscript/ollama-sync.sh}
  '';

  agentScripts = lib.mapAttrs' (
    name: model:
    let
      roDirs = lib.concatStringsSep ":" (cfg.baseSandboxDirs.${name} or [ ]);
      domains = lib.concatStringsSep ":" (cfg.internetDomains.${name} or [ ]);
      bwrapPath = "${pkgs.bubblewrap}/bin/bwrap";
      ollamaPath = "${pkgs.ollama}/bin/ollama";
      template = builtins.readFile ../../../scripts/templates/ai-agent.sh;
      substituted =
        builtins.replaceStrings
          [
            "@AGENT@"
            "@RO_DIRS@"
            "@DOMAINS@"
            "@BWARP@"
            "@OLLAMA@"
            "@MODEL@"
          ]
          [
            name
            roDirs
            domains
            bwrapPath
            ollamaPath
            model
          ]
          template;
    in
    lib.nameValuePair name (
      pkgs.runCommand "ai-agent-${name}" { } ''
            mkdir -p $out/bin
            cat > $out/bin/${name} << 'EOS'
        ${substituted}
        EOS
            chmod +x $out/bin/${name}
      ''
    )
  ) cfg.models;

in
{
  options.custom.ai = {
    enable = lib.mkEnableOption "AI agents with declarative model management";

    models = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = {
        sokka = "codellama:7b";
        aang = "deepseek-math:7b";
        katara = "deepseek-math:7b";
        zuko = "llama3:8b";
      };
      description = "Mapping from agent name to Ollama model tag.";
    };

    removeExtras = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Whether to remove models not in the list.";
    };

    baseSandboxDirs = lib.mkOption {
      type = lib.types.attrsOf (lib.types.listOf lib.types.str);
      default = {
        sokka = [ "/home/givik/Projects" ];
        aang = [ "/home/givik/Storage/wraith/Vaults/Menti/'Menti-P Remote'" ];
        katara = [ "/home/givik/Storage/wraith/Vaults/Menti/'Menti-P Remote'" ];
        zuko = [ ];
      };
      description = "Read-only directories available to each agent.";
    };

    internetDomains = lib.mkOption {
      type = lib.types.attrsOf (lib.types.listOf lib.types.str);
      default = {
        sokka = [ "github.com" ];
        aang = [
          "arxiv.org"
          "scholar.google.com"
        ];
        katara = [
          "arxiv.org"
          "scholar.google.com"
        ];
        zuko = [ "*" ];
      };
      description = "Allowed domains for each agent.";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages =
      with pkgs;
      [
        bubblewrap
        ollama
        syncScript
      ]
      ++ (lib.attrValues agentScripts);

    services.ollama.enable = true;

    systemd.services.ollama-sync = {
      description = "Sync Ollama models declaratively";
      wants = [ "ollama.service" ];
      after = [
        "network.target"
        "ollama.service"
      ];
      wantedBy = [ "multi-user.target" ];
      environment = {
        PATH = "/run/current-system/sw/bin:${pkgs.ollama}/bin:${pkgs.gawk}/bin:${pkgs.bash}/bin";
      };
      path = [
        pkgs.ollama
        pkgs.gawk
        pkgs.bash
        pkgs.coreutils
      ];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = "${syncScript}/bin/ollama-sync";
        SuccessExitStatus = "0 1 2";
      };
    };
  };
}
