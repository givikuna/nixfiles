{ pkgs, ... }: {
  virtualisation.waydroid = {
    enable = true;
    package = with pkgs; waydroid-nftables;
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard
  ];
}
