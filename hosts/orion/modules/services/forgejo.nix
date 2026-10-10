{ ... }: {
  services.forgejo = {
    enable = true;
    database.type = "postgres";
    lfs.enable = true;

    settings = {
      server = {
        DOMAIN = "orion.seraphim";
        HTTP_ADDR = "10.100.0.2"; # only to nebula's ip
        HTTP_PORT = 3000;
        ROOT_URL = "http://10.100.0.2:3000/";
        SSH_PORT = 22;
      };
      service.DISABLE_REGISTRATION = true;
    };
  };

  # Allow access to Forgejo ONLY from the Nebula interface
  networking.firewall.interfaces."nebula.seraphim".allowedTCPPorts = [
    3000
    22
  ];
}
