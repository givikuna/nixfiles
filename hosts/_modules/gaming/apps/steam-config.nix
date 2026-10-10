{
  ...
}:
{
  imports = [
    ./modules/sls-steam.nix
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;

    platformOptimizations = {
      enable = true;
    };
  };

  # might wanna add `nvidia-offload gamemoderun mangohud %command%` as the game's launch options on steam
}
