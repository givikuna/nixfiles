{
  inputs,
  ...
}:
{
  imports =
    with inputs;
    with sls-steam;
    with homeModules;
    [
      sls-steam
    ];

  services.sls-steam = {
    config = {
      PlayNotOwnedGames = true;
      DisableFamilyShareLock = true;

      Notifications = true;
      API = false;

      WarnHashMissmatch = true;

      AdditionalApps = [
        620
        400
        753640
      ];

      DlcData = {
        #
      };
    };
  };
}
