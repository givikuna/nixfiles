{
  nixtants,
  ...
}:
{
  services.nginx = {
    enable = true;
    virtualHosts."${nixtants.domains.punk-racoon.git}" = {
      forceSSL = true;
      enableACME = true;
      locations."/".proxyPass = "http://${nixtants.seraphim-ip}:3000";
    };
  };
}
