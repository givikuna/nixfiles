{
  inputs,
  ...
}:
{
  imports = [ inputs.nixcord.homeModules.nixcord ];

  config = {

    programs.nixcord = {
      enable = true;

      discord.vencord.enable = true;

      quickCss = "/* */";

      config = {
        useQuickCss = true;

        themeLinks = [
          "https://raw.githubusercontent.com/shvedes/discord-gruvbox/refs/heads/main/gruvbox-dark.theme.css"
        ];

        frameless = true;

        plugins = {
          alwaysAnimate.enable = true;
        };
      };
    };

    xdg.desktopEntries.discord = {
      name = "Nixcord";
      genericName = "Internet Messenger";
      exec = "discord";
      icon = "discord";
      type = "Application";
      categories = [
        "Network"
        "InstantMessaging"
      ];
      terminal = false;
    };
  };
}
