{ ... }:
{
  # steam is being added via configuration.nix now instead of apps.nix
  # this might not be the best idea, might switch if disliked
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
  # might wanna add `nvidia-offload gamemoderun mangohud %command%` as the game's launch options on steam
}
