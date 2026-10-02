{ pkgs, ... }: {
  home.packages = with pkgs; [
    nh
    nix-output-monitor
  ];

  programs.nh = {
    enable = true;

    clean.enable = true;

    clean.extraArgs = "--keep-since 9d --keep 5";

    flake = "/etc/nixos";
  };
}
