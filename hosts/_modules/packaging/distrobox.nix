{
  lib,
  pkgs,
  groups,
  ...
}:
{
  imports = lib.optionals (!groups.dockerers) [
    ./modules/distroboxDockerCompat.nix
  ];

  environment.systemPackages = with pkgs; [
    distrobox
    podman
  ];

  virtualisation.podman = {
    enable = true;
    # dockerCompat = true;
  };
}
