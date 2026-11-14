{
  pkgs,
  lib,
  groups,
  ...
}:
{
  imports = [
    ../../packages/configurations/applications/firefox/package.nix
  ]
  ++ lib.optionals groups.flatpakkers [
    ./modules/brave.nix
  ];

  home.packages = with pkgs; [
    google-chrome
    chromium
    # brave
    librewolf
    # inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    lynx
  ];
}
