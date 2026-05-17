{ pkgs, ... }: {
  home.packages = with pkgs; [
    neovim
    micro
    helix
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.code-oss;

    userSettings = builtins.fromJSON (builtins.readFile ../../dotfiles/vscode/settings.json);

    extensions = with pkgs.vscode-extensions; [
      # TBA
    ];
  };

  xdg.configFile."nvim".source = ../../dotfiles/nvim;
}
