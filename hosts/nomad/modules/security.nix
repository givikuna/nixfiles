{ username, ... }: {
  imports = [
    ./modules/dns.nix
    ./modules/usbguard.nix
  ];

  programs.wireshark.enable = true;

  # enforces random mac addresses
  networking.networkmanager.wifi.macAddress = "random";

  users.users.${username}.extraGroups = [ "wireshark " ];
}
