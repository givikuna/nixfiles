{ config, lib, ... }:
let
  cfg = config.custom.certs.acme.xmpp;
in
{
  options.custom.certs.acme.xmpp.enable = lib.mkEnableOption "scx framework";

  config = lib.mkIf cfg.enable {
    security.acme = {
      certs."xmpp.tsvari.io" = {
        email = "givitsvariani@proton.me";
        listenHTTP = ":80";
        postRun = "systemctl reload nginx";
      };
    };
  };
}
