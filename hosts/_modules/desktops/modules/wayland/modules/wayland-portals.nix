{ pkgs, ... }:
{
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # for screen-sharing (stops from getting a black screen)
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common.default = "wlr";
    xdgOpenUsePortal = true;
  };
}
