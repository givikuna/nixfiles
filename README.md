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

```BASH
nix-shell -p git parted --run "bash <(curl -sL https://raw.githubusercontent.com/givikuna/nixfiles/main/install.sh)"
```

After you reboot your system will boot into a fully functioning system.

Until then toodaloo.

For slightly more detailed instructions see `QUICKSTART.md` at root

## Cloud

For Hetzner servers (such as `hammond`):

They need a `disko.nix` file for defining drive layout.

We need a public SSH key for the root user.

And then you can deploy:

```BASH
nix run github:nix-community/nixos-anywhere -- --flake .#hammond root@<HETZNER_PUBLIC_IP>
```
