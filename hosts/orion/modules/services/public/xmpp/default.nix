{ pkgs, ... }: {
  imports = [
    ./modules/nginx.nix

    (import ./modules/prosody.nix {
      pkgs = pkgs;
      domain = "xmpp.tsvari.io";
    })
  ];
}
