{ gvpkgs, ... }: {
  home.packages = with gvpkgs; [
    fregec
  ];
}
