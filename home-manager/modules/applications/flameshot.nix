{ ... }:
{
  services.flameshot = {
    enable = true;

    settings = {
      General = {
        savePath = "/home/user/Screenshots";
        disabledTrayIcon = true;
        showStartupLaunchMessage = true;

        saveAsFileExtension = ".png";

        showDesktopNotification = true;
        showAbortNotification = false;

        showHelp = true;

        showSidePanelButton = true;

        uiColor = "#ea9e48";
        contrastUiColor = "#e75347";
        drawColor = "#d09f2e";

        useGrimAdapter = true;
        disabledGrimWarning = true;
      };
    };
  };
}
