{ pkgs, ... }: {
  imports = [
    # ./devtools/android-dev.nix

    ../packages/derivations/applications/fyrox-project-manager/package.nix
  ];

  home.packages = with pkgs; [
    godot
  ];
}
