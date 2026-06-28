{ pkgs, ... }: {
  imports = [
    ../wayland/wayland.nix
  ];

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    displayManager.defaultSession = "gnome";
  };

  # services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [
    # pkgs
    gnome.gnome-screenshot
    gnome.gnome-terminal
    gnome.nautilus
    gnome.gnome-tweaks

    # extensions
    gnomeExtensions.dash-to-dock
    gnomeExtensions.user-themes
    gnomeExtensions.blur-my-shell
    gnomeExtensions.just-perfection
    gnomeExtensions.arc-menu
  ];

  services.gnome.core-apps.enable = true;
  services.gnome.core-developer-tools.enable = true;
  services.gnome.games.enable = true;

  services.dbus.packages = with pkgs; [
    gnome2.GConf
  ];

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-light";
  };
}
