{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    distrobox
    podman
  ];

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
}
