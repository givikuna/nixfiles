{ pkgs, ... }:
{
  imports = [
    ./_modules/keyring.nix
    ./_modules/distrobox.nix
    ./_modules/sops.nix
    ./_modules/shell-dec.nix
    ./_modules/pipewire.nix
    ./_modules/sys-cleanup.nix
    ./_modules/flatpak.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = with pkgs; [
    glib
    gruvbox-kvantum
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  security.polkit.enable = true;

  # gives swayosd rights
  services.udev.packages = [ pkgs.swayosd ];

  # might switch this away, mostly for video game purposes
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # deprecated now
  # systemd.enableUnifiedCgroupHierarchy = true;

  fonts.packages = with pkgs; [
    nerd-fonts.roboto-mono
    noto-fonts-color-emoji
  ];

  nixpkgs.config.allowUnfree = true;

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

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # gaming optimization stuff:

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;

  # for screen-sharing (stops from getting a black screen)
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = "wlr";
    xdgOpenUsePortal = true;
  };

  # force chromium based apps to use wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XDG_DATA_DIRS = [
      "/run/current-system/sw/share"
      "/home/givik/.nix-profile/share"
    ];
    GTK_THEME = "Gruvbox-Dark-B:dark";
  };

  # to clean out solid-state blocks
  services.fstrim.enable = true;

  # for managing heat
  services.thermald.enable = true;

  # for proper usb reading
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  hardware.xpadneo.enable = true;

  services.printing.enable = true;

  # this should intercept generic calls to binaries and re-connect it to nix store
  # should help give IDEs better integration
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      glibc
    ];
  };

  programs.dconf.enable = true;

  programs.direnv.enable = true;

  #

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  console.keyMap = "us";

  system.stateVersion = "23.11";
}
