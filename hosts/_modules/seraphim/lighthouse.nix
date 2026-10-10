{
  pkgs,
  nixtants,
  hostname,
  ...
}:
{
  environment.systemPackages = [
    pkgs.nebula
  ];

  services.nebula.networks.seraphim = {
    enable = true;
    isLighthouse = true;
    lighthouses = [
      nixtants.hosts.${hostname}.seraphim-ip
    ];

    ca = "/run/ynternals/nebula-${hostname}-ca-crt";
    cert = "/run/ynternals/nebula-${hostname}-orion-crt";
    key = "/run/ynternals/nebula-${hostname}-orion-key";

    staticHostMap = {
      "10.100.0.1" = [
        "<${nixtants.hosts.${hostname}.public-ip}>:4242"
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
