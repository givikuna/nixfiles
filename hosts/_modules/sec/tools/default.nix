{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    macchanger
    tcpdump
  ];
}
