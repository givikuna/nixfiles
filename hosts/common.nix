{ pkgs, ... }:
{
  imports = [
    ./_modules/system/bluetooth.nix
    ./_modules/system/keyring.nix
    ./_modules/system/pipewire.nix
    ./_modules/system/printing.nix
    ./_modules/system/sys-cleanup.nix
    ./_modules/system/shell-dec.nix

    ./_modules/overlays/overlays.nix

    ./_modules/packaging/distrobox.nix
    ./_modules/packaging/flatpak.nix

    ./_modules/misc/fonts.nix
    ./_modules/misc/sops.nix
  ];

  # nix allowances
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  # boot

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking
  networking.networkmanager.enable = true;

  # users & groups
  security.polkit.enable = true;

  users.users.givik = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "input"
    ];
  };

  security.rtkit.enable = true;

  # force chromium based apps to use wayland
  environment.sessionVariables = {
    XDG_DATA_DIRS = [
      "/run/current-system/sw/share"
      "/home/givik/.nix-profile/share"
    ];
  };

  # for proper usb reading
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  programs.dconf.enable = true;

  programs.direnv.enable = true;

  #

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  console.keyMap = "us";

  system.stateVersion = "23.11";
}
