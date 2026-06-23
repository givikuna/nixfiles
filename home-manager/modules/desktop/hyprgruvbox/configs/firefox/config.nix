{ ... }: {
  programs.firefox.profiles.default.userChrome =
    builtins.readFile ../../../../../../dotfiles/firefox/hyprgruvbox/userChrome/userChrome.css;
}
