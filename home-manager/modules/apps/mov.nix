{ pkgs, ... }: {
  imports = [
    ../../packages/configurations/applications/gonwatch/package.nix
  ];

  home.packages = with pkgs; [
    ani-cli
  ];
}
