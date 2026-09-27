# Quick Start

This is a very small file explaining how to get this setup on your system.

## Prerequisites

Get a minimal NixOS ISO and slap it onto a drive, then boot into it.

## Wifi

Connect to wifi using `nmtui`, or ethernet, or whatever else

## Installation

Run this:

```BASH
nix-shell -p git parted --run "bash <(curl -sL https://raw.githubusercontent.com/givikuna/nixfiles/main/install.sh)"
```

## Post-Installation

After that script is done run:

```BASH
reboot
```

After you boot back into your system run:

```BASH
post-install
```

Very simple
