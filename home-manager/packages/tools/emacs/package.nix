{ pkgs, ... }:
{
  home.packages = with pkgs; [
    emacs30

    typescript-language-server
    vscode-langservers-extracted
    cmake-language-server
    lua-language-server

    black
    prettierd
    shfmt

    aspell
    aspellDicts.en
  ];

  home.file.".emacs.d/init.el".source = ../../../../dotfiles/emacs/init.el;
}
