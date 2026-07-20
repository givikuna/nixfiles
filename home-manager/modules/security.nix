{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # net
    nmap

    # password profilers
    (pkgs.callPackage ../packages/derivations/security/cupp/derivation.nix { })

    # password crackers
    john # john the ripper
    hashcat
  ];
}
