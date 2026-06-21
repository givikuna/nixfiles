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
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.arc-menu
  ];

  services.gnome.core-apps.enable = true;
  services.gnome.core-developer-tools.enable = true;
  services.gnome.games.enable = true;

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  services.dbus.packages = with pkgs; [
    gnome2.GConf
  ];
}
