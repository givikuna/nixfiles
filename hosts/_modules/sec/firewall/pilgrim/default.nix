{ lib, config, ... }:
lib.mkIf (config.networking.hostName == "pilgrim") {
  networking.firewall = {
    enable = true;

    logRefusedConnections = true;
  };
}
