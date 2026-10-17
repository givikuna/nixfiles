{ pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    gitui

    difftastic

    git-cliff

    inputs.gh-api-cli.packages.${pkgs.system}.default
  ];
}
