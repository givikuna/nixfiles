{ inputs, pkgs, ... }: {
  home.packages =
    with inputs;
    with anubis-fetch;
    [
      (with packages.${with pkgs; system}; default)
    ];
}
