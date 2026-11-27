{ ... }:
{
  imports = [
    ./cosmic_mod/system76-scheduler.nix
  ];

  services.displayManager.cosmic-greeter.enable = true;

  services.desktopManager.cosmic.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";

    # COSMIC_DATA_CONTROL_ENABLED = 1;
  };
}
