{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };

  home.file.".emacs.d/init.el".source = ../../../../../dotfiles/emacs/init.el;
}
