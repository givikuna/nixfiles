{ lib, config, ... }:
lib.mkIf (config.networking.hostName == "orion") {
  networking.firewall = {
    enable = true;
    logRefusedConnections = true;

    interfaces.enp2s0 =
      let
        range =
          with config.services.coturn;
          lib.singleton {
            from = min-port;
            to = max-port;
          };
      in
      {
        allowedUDPPortRanges = range;
        allowedUDPPorts = [
          3478
          5349
        ];
        allowedTCPPortRanges = [ ];
        allowedTCPPorts = [
          3478
          5349
          5222
          5269
          5280
        ];
      };
  };
}
