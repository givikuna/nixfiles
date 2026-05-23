{ pkgs, ... }:

{
  home.packages = [ pkgs.mission-center ];

  #xdg.desktopEntries."io.missioncenter.MissionCenter" = {
  #  name = "Mission Center";
  #  exec = "env GTK_THEME=Adwaita:dark missioncenter";
  #  icon = "io.missioncenter.MissionCenter";
  #  terminal = false;
  #  categories = [
  #    "System"
  #    "Monitor"
  #  ];
  #};
}
