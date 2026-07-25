{ pkgs, ... }: {
  home.packages = with pkgs; [
    qbittorrent
  ];

  services.flatpak.packages = [
    "de.haeckerfelix.Fragments"
  ];
}
