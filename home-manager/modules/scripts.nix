{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (writeScriptBin "cconvert" (builtins.readFile ../../scripts/cconvert.rkt))
  ];
}
