{ pkgs, ... }: {
  imports = [
    ./modules/wayland/wayland.nix
  ];

  services.displayManager = {
    gdm.enable = true;

    defaultSession = "gnome";
  };

  services.desktopManager.gnome = {
    enable = true;
  };

  services.xserver = {
    enable = true;
  };

  # services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [
    # pkgs
    gnome-screenshot
    gnome-terminal
    nautilus
    gnome-tweaks

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
}
