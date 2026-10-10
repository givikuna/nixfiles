{ nixtants, ... }: {
  services.nginx = {
    enable = true;
    virtualHosts."${nixtants.domains.punk-racoon.git}" = {
      forceSSL = true;
      enableACME = true;
      locations."/".proxyPass = "http://10.100.0.2:3000";
    };
  };
}
