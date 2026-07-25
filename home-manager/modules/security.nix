{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # net
    nmap
    aircrack-ng
    metasploit
    # mitmproxy

    # web
    burpsuite
    gobuster
    nikto
    ffuf
    arjun
    kiterunner
    caido-desktop
    caido-cli
    nuclei
    nuclei-templates

    # password profilers
    # tba

    # password crackers
    john
    hashcat

    # osint
    bloodhound

    # sql
    sqlmap
  ];
}
