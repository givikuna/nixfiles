{
  config,
  # lib,
  # pkgs,
  ...
}:
let
  domain = "matrix.tsvari.io";
  synapse-port = 8008;
  coturn-port = 3478;
  turn-secret-file = config.sops.secrets."coturn/static-auth/secret".path;
  registration-secret-file = config.sops.secrets."synapse/registration-shared-secret".path;
in
{
  imports = [
    # common
    ../../common/default.nix

    # services
    ./services/coturn.nix

    # matrix specific
    (import ./modules/irc-bridge.nix {
      synapse-port = synapse-port;
    })

    (import ./modules/nginx.nix {
      domain = domain;
      synapse-port = synapse-port;
    })

    (import ./modules/synapse.nix {
      registration-secret-file = registration-secret-file;
      domain = domain;
      synapse-port = synapse-port;
      coturn-port = coturn-port;
      turn-secret-file = turn-secret-file;
    })

    ./modules/secrets.nix
  ];
}
