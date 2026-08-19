{ ... }: {
  sops.secrets = {
    "synapse/registration-shared-secret" = {
      sopsFile = ../../../../secrets/secrets.yaml;
      owner = "matrix-synapse";
      group = "matrix-synapse";
    };
    "coturn/static-auth-secret" = {
      sopsFile = ../../../../secrets/secrets.yaml;
      owner = "turnserver";
      group = "turnserver";
    };
  };
}
