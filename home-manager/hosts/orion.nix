{ ... }:
{
  imports = [
    ../server-common.nix
  ];

  my.apps = {
    helix = true;
    micro = true;
    neovim = true;
  };
}
