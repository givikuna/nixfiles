{ ... }:
{
  # clean up system weekly
  nix.optimise.automatic = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # to clean out solid-state blocks
  services.fstrim.enable = true;
}
