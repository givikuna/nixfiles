{ pkgs, ... }: {
  home.packages = with pkgs; [
    nodejs_22

    typescript
    bun

    typescript-language-server

    prettierd

    vscode-langservers-extracted
  ];
}
