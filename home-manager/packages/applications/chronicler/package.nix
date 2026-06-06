{ lib, config, ... }:

lib.mkIf config.my.apps.chronicler {
  services.flatpak.packages = [
    {
      flatpakref = "https://flatpak.chronicler.pro/chronicler.flatpakref";
      sha256 = "1h4rabnmvvnp1v6hisb7i5jwiwq1wbymlaf8425ksh1lzrhzgq67";
    }
  ];
}
