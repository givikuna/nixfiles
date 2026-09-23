{ ... }: {
  imports = [
    ../../modules/apps/basics.nix
    ../../modules/apps/browsers.nix
    ../../modules/apps/discord.nix
    ../../modules/apps/file-mgmt.nix
    ../../modules/apps/gaming.nix
    ../../modules/apps/mov.nix
    ../../modules/apps/spotify.nix
    ../../modules/apps/sys.nix
    ../../modules/apps/term.nix
    ../../modules/apps/tor-browser.nix
    ../../modules/apps/torrent.nix
    ../../modules/apps/txt-edit.nix
    ../../packages/configurations/applications/chronicler/package.nix
    ../../packages/configurations/applications/thunderbird/package.nix
  ];
}
