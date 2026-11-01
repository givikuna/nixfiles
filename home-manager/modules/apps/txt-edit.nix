{
  lib,
  pkgs,
  groups,
  ...
}:
{
  imports = [
    ../../packages/configurations/applications/helix/package.nix
    ../../packages/configurations/applications/micro/package.nix
    ../../packages/configurations/applications/neovim/package.nix
    ../../packages/configurations/applications/zed/package.nix
    ../../packages/configurations/applications/vscode/package.nix
  ]
  ++ lib.optionals groups.grammers [
    ../../packages/configurations/applications/gram/package.nix
  ];

  home.packages = with pkgs; [
    qtcreator
  ];
}
