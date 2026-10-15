{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    glistix
  ];
}
