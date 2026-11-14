{
  pkgs,
  ...
}:
{
  imports = [
    ../common.nix

    ./apps/orion.nix
  ];

  home.packages = with pkgs; [
    # personal
    # planify
    calibre

    # capturing
    gimp
    imagemagick
    switcheroo
    obs-studio

    # kdePackages.kate
  ];

}
