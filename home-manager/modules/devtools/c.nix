{ pkgs, ... }: {
  home.packages = with pkgs; [
    (pkgs.lib.hiPrio gcc)

    cppcheck

    (pkgs.lib.lowPrio clang)
    clang-tools
  ];
}
