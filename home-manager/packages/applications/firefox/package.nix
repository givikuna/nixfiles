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
      path = "default";

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "layers.acceleration.force-enabled" = true;
        "ui.caretWidth" = 4;

        "devtools.chrome.enabled" = true;
        "devtools.debugger.remote-enabled" = true;
      };

      userChrome = builtins.readFile "${dotfiles-dir}/userChrome/userChrome.css";

      userContent = "";
    };
  };
}

# https://givikuna.github.io/givikuna-firefox-landing-page.github.io/
