{ ... }: {
  programs.nushell = {
    enable = true;

    configFile.source = builtins.readFile ../../../../../dotfiles/nushell/config.nu;
    # envFile.source = ../../../../../dotfiles/nushell/env.nu

    extraEnv = ''
      $env.STARSHIP_SHELL = "nu"
      mkdir ~/.cache/starship
      starship init nushell | save -f ~/.cache/starship/init.nu
      source ~/.cache/starship/init.nu

      mkdir ~/.cache/zoxide
      zoxide init nushell | save -f ~/.cache/zoxide/init.nu
      source ~/.cache/zoxide/init.nu
    '';
  };
}
