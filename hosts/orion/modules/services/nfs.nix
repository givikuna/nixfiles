{ ... }: {
  services.nfs.server.enable = true;
  services.nfs.server.exports = ''
    /home/givik/Storage 10.100.0.0/24(rw,sync,no_subtree_check)
  '';

  networking.firewall.interfaces."nebula.seraphim".allowedTCPPorts = [
    2049
    111
  ];
  networking.firewall.interfaces."nebula.seraphim".allowedUDPPorts = [
    2049
    111
  ];
}
