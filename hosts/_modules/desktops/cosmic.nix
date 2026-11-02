{ username, ... }: {
  imports = [
    ./cosmic_mod/system76-scheduler.nix
  ];

  services.displayManager.cosmic-greeter.enable = true;

  services.desktopManager.cosmic = {
    enable = true;

    user = username; # automatic login
  };
}
