{ inputs, ... }:
{
  imports = [
    inputs.zptr.homeManagerModules.default
  ];
  programs.zptr.enable = true;
}
