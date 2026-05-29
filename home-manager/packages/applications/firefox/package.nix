{ lib, config, ... }:
let
  dotfiles-dir = ../../../../dotfiles/firefox;
in
lib.mkIf config.my.apps.firefox {
  programs.firefox = {
    enable = true;
    profiles.default = {
      name = "default";
      isDefault = true;

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "layers.acceleration.force-enabled" = true;
        "ui.caretWidth" = 4;
      };

      userChrome = builtins.readFile "${dotfiles-dir}/userChrome/userChrome.css";

      userContent = "";
    };
  };
}

# https://givikuna.github.io/givikuna-firefox-landing-page.github.io/
