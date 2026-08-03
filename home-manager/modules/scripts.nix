{ pkgs, ... }:
let
  scripts = [
    "cconvert.rkt"
    "dd-k.pl"
    "push-system.sh"
    "move-please.sh"
    "post-install.sh"
    "pull-system.sh"
    "update-system.sh"
    "edit-system.py"
    "rebuild-system.py"
    "ingcpy.sh"
  ];

  mkScript =
    file:
    let
      parts = builtins.match "(.*)\\.([^.]*)$" file;
      name = builtins.elemAt parts 0;
    in
    pkgs.writeScriptBin name (builtins.readFile "${../../scripts}/${file}");
in
{
  home.packages = map mkScript scripts;
}
