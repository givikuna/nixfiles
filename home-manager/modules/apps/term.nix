{ pkgs, ... }: {
  imports = [
    ../../packages/configurations/applications/kitty/package.nix
  ];

  home.packages = with pkgs; [
    tuxedo
  ];
}
