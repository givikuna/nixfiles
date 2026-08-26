{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # net
    nmap
    aircrack-ng
    metasploit
    mitmproxy
    wifite2
    tshark
    # wireshark

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

    # profilers

    # search
    sherlock

    # password crackers
    john
    hashcat

    # osint
    bloodhound

    # sql
    sqlmap

    # rev/exp
    ghidra-bin
    radare2
    binwalk
    gdb
    gef

    # wordlists
    seclists
  ];
}
