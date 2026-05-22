{ pkgs, ... }:
let
  dotfiles-dir = ../../../dotfiles/firefox;

  userContent-path = "${dotfiles-dir}/userContent";
  userContent-files =
    if builtins.pathExists userContent-path then
      builtins.attrNames (builtins.readDir userContent-path)
    else
      [ ];

  process-content = map (
    filename:
    let
      file-path = "${userContent-path}/${filename}";
      is-less = pkgs.lib.hasSuffix ".less" filename;
      domain-name = pkgs.lib.removeSuffix ".less" (pkgs.lib.removeSuffix ".css" filename);
    in
    if is-less then
      ''
        @-moz-document domain("${domain-name}") {
          ${builtins.readFile (
            pkgs.runCommand "${domain-name}.css" { nativeBuildInputs = [ pkgs.nodePackages.less ]; } ''
              lessc ${file-path} $out
            ''
          )}
        }
      ''
    else if filename == ".keep" then
      ""
    else
      ''
        ${builtins.readFile file-path}
      ''
  ) userContent-files;

  final-user-content = pkgs.lib.concatStringsSep "\n" process-content;

in
{
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

      userContent = final-user-content;
    };
  };
}
