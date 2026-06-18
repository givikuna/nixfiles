{ pkgs, ... }: {
  imports = [
    ../wayland/wayland.nix
  ];

  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    displayManager.defaultSession = "gnome";
  };

  # services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [
    gnome.gnome-screenshot
    gnome.gnome-terminal
    gnome.nautilus
    gnome.gnome-tweaks
    gnomeExtensions.dash-to-dock
    gnomeExtensions.user-themes
  ];
}
