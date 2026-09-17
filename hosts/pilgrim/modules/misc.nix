{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gruvbox-kvantum
  ];
}
