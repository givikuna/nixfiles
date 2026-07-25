{ pkgs, ... }: {
  home.packages = with pkgs; [
    android-studio
    android-tools
    androidenv.androidPkgs.androidsdk
    androidenv.androidPkgs.emulator
    androidenv.androidPkgs.ndk-bundle
  ];
}
