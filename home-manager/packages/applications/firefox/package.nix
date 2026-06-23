{
  ...
}:
{
  programs.firefox = {
    enable = true;

    policies = {
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        };
        "addon@darkreader.org" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi";
        };
        "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/styl-us/latest.xpi";
        };
        "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/return-youtube-dislikes/latest.xpi";
        };
        "jid1-MnnxcxisBPnSXQ@jetpack" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
        };
        "adguardadblocker@adguard.com" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/adguard-adblocker/latest.xpi";
          private_browsing = true;
        };
        "adguard-extra@adguard.com" = {
          installation_mode = "normal_installed";
          install_url = "https://agrd.io/adguard_extra_firefox_release";
          private_browsing = true;
        };
        "sponsorBlocker@ajay.app" = {
          default_area = "menupanel";
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
        };
      };

      AppAutoUpdate = false;
      BackgroundAppUpdate = false;

      DisableFirefoxStudies = true;
      DisableTelemetry = true;

      DontCheckDefaultBrowser = true;

      AIControls.Default.Value = "blocked";

      EnableTrackingProtection = {
        Category = "strict";
        Cryptomining = true;
        EmailTracking = true;
        Fingerprinting = true;
        SuspectedFingerprinting = true;
        Value = true;
      };
    };

    profiles.default = {
      name = "default";
      isDefault = true;
      path = "default";

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "layers.acceleration.force-enabled" = true;
        "gfx.downloadable_fonts.enabled" = true;

        "devtools.chrome.enabled" = true;
        "devtools.debugger.remote-enabled" = true;

        "browser.tabs.groups.enabled" = true;
      };

      search = {
        force = true;
        default = "ddg";
        order = [
          "ddg"
          "wikipedia"
          "brave"
          "ecosia"
          "nixos wiki"
        ];
        engines = {
          "bing".metaData.hidden = true;
          "google".metaData.hidden = true;
          "amazondotcom-us".metaData.hidden = true;
          "ebay".metaData.hidden = true;
          "perplexity".metaData.hidden = true;

          "ddg" = {
            urls = [ { template = "https://duckduckgo.com/?q={searchTerms}"; } ];
            icon = "https://upload.wikimedia.org/wikipedia/en/9/90/The_DuckDuckGo_Duck.png";
            definedAliases = [ "@ddg" ];
          };
          "wikipedia" = {
            urls = [ { template = "https://en.wikipedia.org/wiki/Special:Search?search={searchTerms}"; } ];
            icon = "https://upload.wikimedia.org/wikipedia/en/thumb/8/80/Wikipedia-logo-v2.svg/250px-Wikipedia-logo-v2.svg.png";
            definedAliases = [ "@wiki" ];
          };
          "brave" = {
            urls = [ { template = "https://search.brave.com/search?q={searchTerms}"; } ];
            icon = "https://upload.wikimedia.org/wikipedia/commons/5/51/Brave_icon_lionface.png";
            definedAliases = [ "@brave" ];
          };
          "ecosia" = {
            urls = [ { template = "https://www.ecosia.org/search?q={searchTerms}"; } ];
            icon = "https://play-lh.googleusercontent.com/Ric37SXVuhw-1uK7TzgUvERNCxOMg9WvjNnCfbzQ4tUZgvzDj-bY6RIfEdaAnltr";
            definedAliases = [ "@eco" ];
          };
          "nixos wiki" = {
            urls = [ { template = "https://wiki.nixos.org/index.php?search={searchTerms}"; } ];
            icon = "https://gitlab.com/uploads/-/system/project/avatar/40517887/68747470733a2f2f692e696d6775722e636f6d2f367146436c41312e706e67.png";
            definedAliases = [ "@nix" ];
          };
          "yt" = {
            urls = [ { template = "https://www.youtube.com/results?search_query={searchTerms}"; } ];
            icon = "https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/YouTube_full-color_icon_%282017%29.svg/1280px-YouTube_full-color_icon_%282017%29.svg.png";
            definedAliases = [ "@yt" ];
          };
          "odysee" = {
            urls = [ { template = "https://odysee.com/$/search?q={searchTerms}"; } ];
            icon = "https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Odysee_Icon.svg/960px-Odysee_Icon.svg.png";
            definedAliases = [ "@ody" ];
          };
          "nebula" = {
            urls = [ { template = "https://nebula.tv/search?q={searchTerms}"; } ];
            icon = "https://upload.wikimedia.org/wikipedia/en/b/b6/Nebula_Logo.png";
            definedAliases = [ "@neb" ];
          };
          "reddit" = {
            urls = [ { template = "https://www.reddit.com/search?q={searchTerms}"; } ];
            icon = "https://upload.wikimedia.org/wikipedia/en/thumb/b/bd/Reddit_Logo_Icon.svg/250px-Reddit_Logo_Icon.svg.png";
            definedAliases = [ "@reddit" ];
          };
        };
      };

      userContent = "";
    };
  };
}

# https://givikuna.github.io/givikuna-firefox-landing-page.github.io/
