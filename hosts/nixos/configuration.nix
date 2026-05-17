{ pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  programs.hyprland.enable = true;

  programs.fish.enable = true;

  systemd.enableUnifiedCgroupHierarchy = true;

  fonts.packages = with pkgs; [
    nerd-fonts.roboto-mono
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

  system.stateVersion = "23.11";
}
