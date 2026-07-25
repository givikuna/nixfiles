{ pkgs, ... }: {
  home.packages = with pkgs; [
    black
    prettierd
    shfmt
    stylua
    nixfmt
  ];
}
