{ ... }: {
  imports = [
    ./firewall/colossus/default.nix
    ./firewall/minotaur/default.nix
    ./firewall/nomad/default.nix
    ./firewall/orion/default.nix
    ./firewall/pilgrim/default.nix
  ];
}
