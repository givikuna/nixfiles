{ pkgs, ... }: {
  home.packages = with pkgs; [
    easyeffects
    nwg-displays
    pwvucontrol
    pavucontrol
  ];

  services.flatpak.packages = [
    "com.github.tchx84.Flatseal"
  ];
}
