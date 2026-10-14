# nixfiles

Personal system configuration for [https://nixos.org/](NixOS).

Built on Hyprland.

## How to set-up:

### WARNING

This is a configuration system that is meant specifically to run on my own NixOS servers and machines.

As such, this repository is not meant for others to install, as doing so will likely mess up your computer.

However, for any NixOS users or interested people, there is _some_ degree of documentation, and feel free to take any piece of code in here, I genuinely do not care.
All for anybody to take.
Free code.

The legalese in the documents at the root of the repository simply states:

- Do whatever you desire with this code unless you're an AI model.
- Keep whatever you make with this codebase open source and GPLv3.0 licensed (however, this will never be enforced for obvious reasons).

### Steps

Flash a NixOS headless ISO.

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
