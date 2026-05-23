{ ... }:
let
  dotfiles-dir = ../../../dotfiles/firefox;
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

      userContent = "";
    };
  };
}
