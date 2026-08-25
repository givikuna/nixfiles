{ ... }: {
  networking.networkmanager.insertNameservers = [
    "1.1.1.1"
    "9.9.9.9"
  ];

  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = [ "~." ];
    fallbackDns = [
      "1.1.1.1"
      "9.9.9.9"
    ];
    dnsovertls = "opportunistic";
  };
}
