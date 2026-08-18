{ lib, config, ... }:
lib.mkIf (config.networking.hostName == "nomad") {
  networking.firewall = {
    enable = true;

    logRefusedConnections = true;
  };
}
