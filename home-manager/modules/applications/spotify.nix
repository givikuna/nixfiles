{
  pkgs,
  inputs,
  ...
}:
let
  lazyspotify = pkgs.callPackage ./derived/lazyspotify/default.nix {
    src = inputs.lazyspotify;
  };
in
{
  home.packages = with pkgs; [
    spotify
    spotify-player
    lazyspotify
  ];
}
