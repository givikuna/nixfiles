{
  # pkgs,
  ...
}:
{
  imports = [
    ../../packages/configurations/applications/dolphin/package.nix
  ];

  home.packages = [
    # thunar
  ];
}
