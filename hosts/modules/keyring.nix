{ pkgs, ... }:
{
  services.gnome.gnome-keyring.enable = true;

  security.pam.services = {
    hyprlock = { };
    login = {
      enableGnomeKeyring = true;
    };
  };

  environment.systemPackages = with pkgs; [
    libsecret
  ];
}
