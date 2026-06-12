{ lib, config, ... }:
lib.mkIf config.my.apps.firefox {
  programs.firefox = {
    enable = true;

    policies = {
      AppAutoUpdate = false;
      BackgroundAppUpdate = false;

      DisableFirefoxStudies = true;
      DisableTelemetry = true;

      DontCheckDefaultBrowser = true;
    };

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

      userContent = "";
    };
  };
}

# https://givikuna.github.io/givikuna-firefox-landing-page.github.io/
