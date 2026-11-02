{ ... }: {
  imports = [
    ./modules/wayland/wayland.nix
  ];

  # services.displayManager.plasma-login-manager = {
  #   enable = true;
  # };

  services.displayManager.sddm = {
    enable = true;

    wayland.enable = true;
  };

  services.desktopManager.plasma6 = {
    enable = true;
  };
}
