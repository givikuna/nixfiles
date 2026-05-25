{ pkgs, ... }:
{
  imports = [
    ./modules/boxes.nix
    ./modules/keyring.nix
    ./modules/distrobox.nix
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

  programs.hyprland.enable = true;
  programs.fish.enable = true;
  programs.zsh.enable = true;
  environment.shells = with pkgs; [
    fish
    zsh
    bash
    nushell
  ];

  users.users.givik.shell = pkgs.fish;

  # gives swayosd rights
  services.udev.packages = [ pkgs.swayosd ];

  # might have to move this up above hyprland and polkit, we'll see
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --asterisks --cmd start-hyprland";
        user = "greeter";
      };
    };
  };

  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
  # end of file block for the greeter

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
    # shell = pkgs.fish; # declared in shell.nix now
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "input"
    ];
  };

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.tlp.enable = true;

  # might move flatpak stuff to its own module=
  services.flatpak = {
    enable = true;
    uninstallUnmanaged = false;
  };

  # gaming optimization stuff:

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;

  # steam is being added via configuration.nix now instead of apps.nix
  # this might not be the best idea, might switch if disliked
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
  # might wanna add `nvidia-offload gamemoderun mangohud %command%` as the game's launch options on steam

  # for screen-sharing (stops from getting a black screen)
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
    config.common.default = "hyprland";
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

  # clean up system weekly
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # to clean out solid-state blocks
  services.fstrim.enable = true;

  # for managing heat
  services.thermald.enable = true;

  # for proper usb reading
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  hardware.xpadneo.enable = true;

  # printing
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

  environment.pathsToLink = [ "/share/hypr" ];

  programs.dconf.enable = true;

  #

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  console.keyMap = "us";

  system.stateVersion = "23.11";
}
