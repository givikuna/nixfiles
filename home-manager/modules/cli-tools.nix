{ pkgs, ... }:
{
  imports = [
    ./nutils/nutils.nix
    ../packages/tools/emacs/package.nix
  ];

  home.packages = with pkgs; [
    curl

    ouch

    zenith
    bandwhich

    tokei

    fzf

    yt-dlp

    repomix
  ];
}

/*
  not a cli-tool but

  do not forget about powerprofilesctl

  for power profiles

  very important

  you'll need this later and be very sad when you can't find it

  but then you'll thank past you for writing this little thing down
*/
