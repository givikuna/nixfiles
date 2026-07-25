{ ... }: {
  imports = [
    ../../packages/configurations/applications/nixcord/package.nix
  ];

  services.flatpak.packages = [
    "com.discordapp.Discord"
  ];
}
