{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (discord.override {
      commandLineArgs = [
        "--enable-features=UseOzonePlatform,WaylandWindowDecorations"
        "--ozone-platform=wayland"
        "--enable-webrtc-pipewire-capturer"
      ];
      withTTS = true;
    })
    vesktop
    legcord
  ];
}
