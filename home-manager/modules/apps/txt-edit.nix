{ pkgs, ... }: {
  imports = [
    ../../packages/configurations/applications/helix/package.nix
    ../../packages/configurations/applications/micro/package.nix
    ../../packages/configurations/applications/neovim/package.nix
    ../../packages/configurations/applications/gram/package.nix
    ../../packages/configurations/applications/vscode/package.nix
  ];

  home.packages = with pkgs; [
    qtcreator
  ];
}
