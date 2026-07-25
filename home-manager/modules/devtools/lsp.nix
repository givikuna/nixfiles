{ pkgs, ... }: {
  home.packages = with pkgs; [
    typescript-language-server
    vscode-langservers-extracted
    cmake-language-server
    lua-language-server
    nixd
  ];
}
