{
  pkgs,
  ...
}:
{
  imports = [
    ../distrobox/lazyspotify-arch.nix
  ];

  home.packages = with pkgs; [
    spotify
    spotify-player
  ];
}
