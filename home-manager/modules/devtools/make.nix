{ pkgs, ... }: {
  home.packages = with pkgs; [
    gnumake
    cmake

    ninja

    cmake-language-server
  ];
}
