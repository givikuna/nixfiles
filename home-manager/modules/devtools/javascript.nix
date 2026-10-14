{
  pkgs,
  config,
  ...
}:
let
  multiverse = with config.multiverse; pinned;
in
{
  home.packages =
    with pkgs;
    [
      nodejs_22

      typescript
      bun

      prettierd

      vscode-langservers-extracted
    ]
    ++ (
      let
        multiverse-pkgs = with multiverse; [
          typescript-language-server
        ];
      in
      multiverse-pkgs
    );
}
