{
  pkgs,
  ...
}:
{
  home.packages =
    (with pkgs; [
      android-studio
      android-tools
    ])
    ++ (
      with pkgs;
      with androidenv;
      with androidPkgs;
      [
        androidsdk
        emulator
        ndk-bundle
      ]
    );
}
