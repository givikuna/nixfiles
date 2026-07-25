{ pkgs, ... }: {
  services.tor = {
    enable = true;
    openFirewall = true;

    relay = {
      enable = false;
    };

    client = {
      enable = true;
    };

    settings = {
      UseBridges = true;
      ClientTransportPlugin = "obfs4 exec ${pkgs.obfs4}/bin/lyrebird";
      Bridge = "obfs4 IP:ORPort [fingerprint]";
    };
  };
}
