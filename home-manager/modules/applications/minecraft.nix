{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (prismlauncher.override {
      jdks = [
        graalvmPackages.graalvm-ce
        zulu8
        zulu17
        zulu
        jdk21
        jdk17
        jdk8
      ];
    })
  ];

  services.flatpak.packages = [
    "com.mojang.Minecraft"
  ];
}
