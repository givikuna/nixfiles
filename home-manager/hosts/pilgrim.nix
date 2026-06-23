{ ... }:
{
  imports = [
    ../common.nix

    ../modules/desktop/gnomeadwaita/desktop.nix
  ];

  services.flatpak.remotes = [
    {
      name = "flathub-beta";
      location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
    }
  ];
}
