{ ... }: {
  programs.ryoku = {
    enable = true;
    defaultCompositor = "hyprland";
    browser = "chromium";
  };
}
