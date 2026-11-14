{
  lib,
  groups,
  ...
}:
lib.mkIf groups.flatpakkers {
  services.flatpak = {
    enable = true;
    uninstallUnmanaged = true;

    remotes = [
      {
        name = "flathub";
        location = "https://flathub.org/repo/flathub.flatpakrepo";
      }
      {
        name = "flathub-beta";
        location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
      }
    ];
  };
}
