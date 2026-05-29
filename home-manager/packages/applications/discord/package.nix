{
  pkgs,
  lib,
  config,
  ...
}:
lib.mkIf config.my.apps.discord {
  home.packages = with pkgs; [
    (discord.override {
      commandLineArgs = [
        "--enable-features=UseOzonePlatform,WaylandWindowDecorations"
        "--ozone-platform=wayland"
        "--enable-webrtc-pipewire-capturer"
      ];
      withTTS = true;
    })
  ];
}
