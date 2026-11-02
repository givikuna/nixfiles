{ ... }: {
  imports = [
    ./modules/wayland/wayland.nix

    ./gnome_mod/gdm.nix
  ];

  services.desktopManager.gnome = {
    enable = true;
  };

  services.gnome = {
    core-apps = {
      enable = true;
    };

    core-developer-tools = {
      enable = true;
    };

    games = {
      enable = true;
    };
  };
}
