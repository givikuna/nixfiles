{
  config,
  lib,
  pkgs,
  ...
}:
let
  mkContainerConfig = name: boxConfig: ''
    [${name}]
    image="${boxConfig.image}"
    pull=${if boxConfig.pull then "1" else "0"}
    ${lib.optionalString (
      boxConfig.pre_init_hooks != ""
    ) "pre_init_hooks=\"${boxConfig.pre_init_hooks}\""}
    ${lib.optionalString (boxConfig.init_hooks != "") "init_hooks=\"${boxConfig.init_hooks}\""}
    ${lib.optionalString (boxConfig.exported_apps != "") "exported_apps=\"${boxConfig.exported_apps}\""}
    ${lib.optionalString (boxConfig.exported_bins != "") "exported_bins=\"${boxConfig.exported_bins}\""}
  '';

  distroboxIniContent = lib.concatStringsSep "\n" (
    lib.mapAttrsToList mkContainerConfig config.my.distrobox.containers
  );

  declaredContainersList = lib.attrNames config.my.distrobox.containers;
  declaredContainersArgs = lib.concatStringsSep " " declaredContainersList;

  pythonGc = pkgs.writeScriptBin "clean-distrobox-garbage" ''
    #!${pkgs.python3}/bin/python3
    ${builtins.readFile ../../scripts/collect-distrobox-garbage.py}
  '';
in
{
  options.my.distrobox = {
    enable = lib.mkEnableOption "assembly engine";
    containers = lib.mkOption {
      description = "attrs";
      default = { };
      type = lib.types.attrsOf (
        lib.types.submodule {
          options = {
            image = lib.mkOption { type = lib.types.str; };
            pull = lib.mkOption {
              type = lib.types.bool;
              default = true;
            };
            pre_init_hooks = lib.mkOption {
              type = lib.types.str;
              default = "";
            };
            init_hooks = lib.mkOption {
              type = lib.types.str;
              default = "";
            };
            exported_apps = lib.mkOption {
              type = lib.types.str;
              default = "";
            };
            exported_bins = lib.mkOption {
              type = lib.types.str;
              default = "";
            };
          };
        }
      );
    };
  };

  config = lib.mkIf config.my.distrobox.enable {
    home.packages = [ pkgs.distrobox ];
    home.sessionPath = [ "${config.home.homeDirectory}/.local/bin" ];
    xdg.configFile."distrobox/distrobox.ini".text = distroboxIniContent;

    systemd.user.services.distrobox-assemble = {
      Unit = {
        Description = "container assembly";
        After = [ "network-online.target" ];
        Wants = [ "network-online.target" ];
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
      Service = {
        Type = "oneshot";

        ExecStartPre = "${pythonGc}/bin/clean-distrobox-garbage ${pkgs.distrobox}/bin/distrobox ${config.home.homeDirectory}/.local/bin ${declaredContainersArgs}";

        ExecStart = "${pkgs.distrobox}/bin/distrobox-assemble create --file ${config.xdg.configHome}/distrobox/distrobox.ini";
        RemainAfterExit = true;
      };
    };
  };
}
