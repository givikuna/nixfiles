{ pkgs, inputs, ... }: {
  home.packages = [
    inputs.resumeworks.packages.${pkgs.system}.default
  ];
}
