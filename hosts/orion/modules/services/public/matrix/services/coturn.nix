{
  config,
  lib,
  ...
}:
let
  domain = config.networking.domain or "coturn.tsvari.io";
in
{
  services.coturn = {
    enable = true;
    realm = domain;
    static-auth-secret-file = config.sops.secrets."coturn/static-auth-secret".path;
    min-port = 49152;
    max-port = 65535;
    cert = "/var/lib/acme/${domain}/fullchain.pem";
    pkey = "/var/lib/acme/${domain}/key.pem";
    extraConfig = ''
      no-tcp-relay
      # If you want to allow TCP TURN (optional)
      # relay-tcp
    '';
  };

  networking.firewall.interfaces.enp2s0 = {
    allowedUDPPorts = [
      3478
      5349
    ]
    ++ (lib.range 49152 65535);
    allowedTCPPorts = [
      3478
      5349
    ];
  };

  security.acme.certs.${domain}.postRun = "systemctl restart coturn.service";
}
