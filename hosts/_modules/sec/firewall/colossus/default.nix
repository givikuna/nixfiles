{ lib, config, ... }:
lib.mkIf (config.networking.hostName == "colossus") {
  networking.firewall = {
    enable = true;

    allowedTCPPorts = [
      # 22 # ssh
    ];

    rejectPackets = true;
    logRefusedConnections = true;
  };
}
