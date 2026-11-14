{
  pkgs,
  groups,
  lib,
  ...
}:
{
  config = lib.mkMerge [
    {
      home.packages = with pkgs; [
        qbittorrent
      ];
    }
    (lib.mkIf groups.flatpakkers {
      # services.flatpak.packages =
      #   [ ]
      #   ++ (lib.optionals groups.flatpakkers [
      #     "de.haeckerfelix.Fragments"
      #   ]);
    })
  ];
}
