{ pkgs, ... }: {
  home.packages = with pkgs; [
    gitui

    difftastic

    git-cliff
  ];
}
