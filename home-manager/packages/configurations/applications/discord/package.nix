{ ... }: {
  programs.discord = {
    enable = true;
  };

  /*
    services.flatpak.packages = [
      "com.discordapp.Discord"
    ];

    services.flatpak.overrides = {
      "com.discordapp.Discord" = {
        Context = {
          sockets = [
            "wayland"
            "fallback-x11"
          ];
        };

        Environment = {
          "ELECTRON_OZONE_PLATFORM_HINT" = "auto";
          "NIXOS_OZONE_WL" = "1";
        };
      };
    };
  */
}
