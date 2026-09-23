{ config, ... }: {
  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    documents = "${config.home.homeDirectory}/Documents";
    pictures = "${config.home.homeDirectory}/Pictures";
    videos = "${config.home.homeDirectory}/Videos";
    download = "${config.home.homeDirectory}/Download";

    desktop = null;
    music = null;
    publicShare = null;
    templates = null;

    extraConfig = {
      XDG_PROJECTS_DIR = "${config.home.homeDirectory}/Projects";
      XDG_TESTING_DIR = "${config.home.homeDirectory}/Testing";
      XDG_MACHINES_DIR = "${config.home.homeDirectory}/Machines";
      XDG_AI-QUARANTINE_DIR = "${config.home.homeDirectory}/ai-quarantine";
    };
  };
}
