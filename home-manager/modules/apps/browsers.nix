{ pkgs, inputs, ... }: {
  imports = [
    ../../packages/configurations/applications/firefox/package.nix
  ];

  home.packages = with pkgs; [
    google-chrome
    chromium
    # brave
    librewolf
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    lynx
  ];

  services.flatpak.packages = [
    "com.brave.Browser"
  ];
}
