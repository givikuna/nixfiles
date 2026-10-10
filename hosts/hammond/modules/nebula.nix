{ pkgs, nixtants, ... }: {
  environment.systemPackages = [
    pkgs.nebula
  ];

  services.nebula.networks.seraphim = {
    enable = true;
    isLighthouse = true;
    lighthouses = [
      nixtants.hosts.hammond.seraphim-ip
    ];

    ca = "/run/ynternals/nebula-ca-crt";
    cert = "/run/ynternals/nebula-orion-crt";
    key = "/run/ynternals/nebula-orion-key";

    staticHostMap = {
      "10.100.0.1" = [
        "<${nixtants.hosts.hammond.public-ip}>:4242"
      ];
    };

    firewall = {
      outbound = [
        {
          host = "any";
          port = "any";
          proto = "any";
        }
      ];
      inbound = [
        {
          host = "any";
          port = "any";
          proto = "any";
        }
      ];
    };
  };

  networking.firewall.allowedUDPPorts = [ 4242 ];
}
