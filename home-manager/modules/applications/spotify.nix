{
  pkgs,
  inputs,
  ...
}:
let
  lazyspotify = pkgs.callPackage ./derivations/lazyspotify/default.nix {
    src = inputs.lazyspotify;
  };
in
{
  home.packages = with pkgs; [
    spotify
    spotify-player
    lazyspotify
  ];

  # home.file.".config/lazyspotify/config.yml".text = ''
  #   auth:
  #     client_id: "${builtins.readFile config.sops.secrets."lazyspotify/client_id".path}"
  # '';
}
