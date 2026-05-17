{ pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
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

  security.pam.services.hyprlock = {};

  # might have to move this up above hyprland and polkit, we'll see
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --asterisks --cmd /run/current-system/sw/bin/Hyprland";
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

  systemd.enableUnifiedCgroupHierarchy = true;

  fonts.packages = with pkgs; [
    nerd-fonts.roboto-mono
    noto-fonts-emoji
  ];

  services.flatpak.enable = true;

  nixpkgs.config.allowUnfree = true;

  users.users.givik = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
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

  # might move flatpak stuff to its own module
  services.flatpak = {
    enable = true;

    uninstallUnmanaged = true;

    packages = [
      "com.heroicgameslauncher.hgl"
      "net.lutris.Lutris"
      "org.freedesktop.Platform.VulkanLayer.MangoHud" # to give mangohud access to lutris and heroic games
    ];
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

  # nvidia driver stuff
  # if copying my system I would change the stuff here
  # this will not work on everyone's computers
  # I'll keep these commented out for now until later
  #services.xserver.videoDrivers = ["nvidia"];

  #hardware.nvidia = {
  #  modesetting.enable = true;
  #  powerManagement.enable = true;
  #  powerManagement.finegrained = true;
  #
  #  open = true;
  #  nvidiaSettings = true;
  #  package = config.boot.kernelPackages.nvidiaPackages.stable;
  #
  #  prime = {
  #    offload = {
  #      enable = true;
  #      enableOffloadCmd = true;
  #    };
  #
  #    # run `lspci | grep -E "VGA|3D"`
  #    # this is to verify the addresses
  #    intelBusId = "PCI:0:2:0";
  #    nvidiaBusId = "PCI:1:0:0";
  #  };
  #};



  # for screen-sharing (stops from getting a black screen)
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "*";
  };

  # force chromium based apps to use wayland
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # clean up system weekly
  nix.optimize.automatic = true;
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

  # keyring to avoid re-logins
  services.gnome.gnome-keyring.enable = true;

  hardware.xpadneo.enable = true;

  # printing
  services.printing.enable = true;



  #





  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  console.keyMap = "us";

  system.stateVersion = "23.11";
}
