{ pkgs, ... }: {
  # this should intercept generic calls to binaries and re-connect it to nix store
  # should help give IDEs better integration
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      glibc
      glib
    ];
  };
}
