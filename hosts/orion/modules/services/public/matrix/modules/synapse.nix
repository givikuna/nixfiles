{
  registration-secret-file,
  domain,
  synapse-port,
  coturn-port,
  turn-secret-file,
  ...
}:
{
  services.matrix-synapse = {
    enable = true;
    server_name = domain;
    enable_registration = false;
    registration_shared_secret_file = registration-secret-file;

    database_type = "psycopg2";

    user = "matrix-synapse";
    database = "matrix-synapse";
    host = "/run/postgresql";
    password = ""; # passwordFile use sops

    listeners = [
      {
        port = synapse-port;
        bind_address = "127.0.0.1";
        type = "http";
        tls = false;
        x_forwarded = true;
        resources = [
          {
            names = [
              "client"
              "federation"
            ];
            compress = false;
          }
        ];
      }
    ];

    settings = {
      turn_uris = [
        "turn:${domain}:${toString coturn-port}?transport=udp"
        "turn:${domain}:${toString coturn-port}?transport=tcp"
      ];
      turn_shared_secret_file = turn-secret-file;
      turn_user_lifetime = "1h";

      enable_search = true;
    };
  };
}
