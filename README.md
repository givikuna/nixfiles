# nixfiles

Personal system configuration for [https://nixos.org/](NixOS).

Built on Hyprland.

## If you want to try out:

Flash a NixOS iso w/ Gnome or headless.

You don't need to do any setup besides what's here.

If on wi-fi run:

```BASH
nmtui
```

The TUI here will show you how to set up your stuff.

Then run this script and response any prompts it gives you:

```BASHpath
nix-shell -p git parted --run "bash <(curl -sL https://raw.githubusercontent.com/givikuna/nixfiles/main/install.sh)"
```

You're forced to use **givik** as your username.
You can fork this repo or something and change that if you really want to.

After you reboot your system will boot into a fully functioning system.

If you want documentation I will eventually be including a docs folder with all the necessary information on how to use this setup in markdown files.
And an app to host it after running some command locally so you can read it and understand it or whatever.

Until then toodaloo.
