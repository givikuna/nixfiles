{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    guix
  ];

  services.guix = {
    enable = true;
    package = with pkgs; guix;

    gc = {
      enable = true;

      extraArgs = [
        "--optimize"
      ];
    };
  };

  # symlinks are at ./home-manager/modules/guix.nix
}
