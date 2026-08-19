{ config, lib, ... }:
let
  cfg = config.custom.certs.acme.coturn.realm;
in
{
  options.custom.certs.acme.coturn.realm.enable = lib.mkEnableOption "scx framework";

  config = lib.mkIf cfg.enable {
    security.acme = {
      acceptTerms = true;

      defaults = {
        email = "givitsvariani@proton.me";
      };

      certs = {
        ${config.services.coturn.realm} = {
          listenHTTP = ":80";

          postRun = "systemctl restart coturn.service";
          group = "turnserver";
        };
      };
    };
  };
}
