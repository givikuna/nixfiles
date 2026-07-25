{ pkgs, ... }: {
  imports = [
    ../../packages/configurations/applications/dolphin/package.nix
  ];

  home.packages = with pkgs; [
    thunar
  ];
}
