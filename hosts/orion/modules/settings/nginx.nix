{ ... }: {
  services.nginx = {
    enable = true;

    enableACME = true;
    forceSSL = true;

    recommendedProxySettings = true;
    recommendedTlsSettings = true;
  };
}
