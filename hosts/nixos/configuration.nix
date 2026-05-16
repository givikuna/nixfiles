{ pkgs, ... }: {
  import = [ ./hardware-configuration.nix ]

  boot.loader.systemd-boot.enable = true;
  boot.loaoder.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  programs.hyprland.enable = true;

  systemd.enableUnifiedCgroupHierarchy = true;

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "RobotoMono" ]; })
  ];

  services.flatpak.enable = true;

  users.users.givik = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
  }

  system.stateVersion = "23.11";
}
