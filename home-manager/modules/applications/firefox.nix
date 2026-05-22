{ pkgs, ... }:
let
  dotfiles-dir = ../../../dotfiles/firefox;

  userContent-path = "${dotfiles-dir}/userContent";
  userContent-files =
    if builtins.pathExists userContent-path then
      builtins.attrNames (builtins.readDir userContent-path)
    else
      [ ];

  valid-files = builtins.filter (f: f != ".keep") userContent-files;

  stylusStyles = builtins.listToAttrs (map (filename:
    let
      domain-name = pkgs.lib.removeSuffix ".less" (pkgs.lib.removeSuffix ".css" filename);
      is-less = pkgs.lib.hasSuffix ".less" filename;
      file-path = "${userContent-path}/${filename}";

      compiled-css = if is-less then
        builtins.readFile (pkgs.runCommand "${domain-name}.css" { nativeBuildInputs = [ pkgs.nodePackages.less ]; } ''
          lessc ${file-path} $out
        '')
      else
        builtins.readFile file-path;

     userstyle-text = ''
        /* ==UserStyle==
        @name         Nix-${domain-name}
        @namespace    givik-nix
        @version      1.0.0
        ==/UserStyle== */

        ${compiled-css}
      '';
    in
    {
      name = ".config/stylus-styles/${filename}";
      value = { text = userstyle-text; };
    }
  ) valid-files);

in
{
  home.file = stylusStyles;

  programs.firefox = {
    enable = true;
    profiles.default = {
      name = "default";
      isDefault = true;

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "layers.acceleration.force-enabled" = true;
      };

      userChrome = builtins.readFile "${dotfiles-dir}/userChrome/userChrome.css";

      userContent = "";
    };
  };
}