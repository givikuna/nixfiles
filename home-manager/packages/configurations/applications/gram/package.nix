{
  # config,
  # inputs,
  pkgs,
  ...
}:
let
  # gram-extensions = inputs.gram-extensions;
in
let
  /*
    extensions = with gram-extensions; [
      bearded-icons
      catppuccin
      catppuccin-icons
      deno
      helm
      graphql
      gdscript
      git-firefly
      night-owlz
      typst
    ];
    extensions-dir = gram-extensions.default.linkGramExtensions extensions;
  */
in
{
  /*
    xdg.dataFile."gram/extensions/installed" = {
      enable = pkgs.stdenv.hostPlatform.isLinux;
      source = extensions-dir;
      onChange = ''
        cd "${config.xdg.dataHome}/gram/extensions"
        mv index.json index.json.backup
      '';
    };
  */
  home.packages = with pkgs; [
    gram
  ];
}
