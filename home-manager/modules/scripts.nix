{
  pkgs,
  inputs,
  ...
}:
let
  mkScript = inputs.mk-script.lib.mkScript pkgs {
    executeFromRoot = false;
    src = ../../scripts;

    customInterpreters = {
      # "rkt" = "${with pkgs; racket}/bin/racket";
    };
  };

  scripts = [
    "cconvert.rkt"
    "dd-k.pl"
    "push-system.sh"
    "move-please.sh"
    "ntest.rkt"
    "post-install.nu"
    "pull-system.sh"
    "update-system.sh"
    "nixos-config.tui.elv"
    "edit-system.elv"
    "proj.elv"
    "rebuild-system.py"
    "ingcpy.sh"
    "most-used-langs.py"
    "nix-fingerprint.elv"
    "git-remote-add.rkt"
  ];
in
{
  home.packages =
    let
      mker = (
        file:
        let
          name =
            let
              parts = builtins.match "(.*)\\.([^.]*)$" file;
            in
            builtins.elemAt parts 0;
        in
        mkScript name file
      );
    in
    map mker scripts;
}
