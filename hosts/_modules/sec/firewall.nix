{ ... }: {
  networking.firewall = {
    enable = true;

    allowedTCPPorts = [
      # 22 # ssh
      27036 # steam
    ];
    allowedUDPPorts = [
      27031 # steam
      27036 # steam
    ];

    # rejectPackets = true; # ICMP
    logRefusedConnections = true;

    # dropping only pings for now
    # will do more once I know more
    # extraRules = ''
    #   icmp_type echo-request drop
    # '';
  };
}
