{ pkgs, ... }: {
  imports = [
    ../../packages/configurations/applications/helix/package.nix
    ../../packages/configurations/applications/micro/package.nix
    ../../packages/configurations/applications/neovim/package.nix
  ];

  home.packages = with pkgs; [
    vscode
    qtcreator
  ];
}
