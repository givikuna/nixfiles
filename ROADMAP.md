# Roadmap

This is a document that changes a lot.

## Status Legend

🟢 Done
🟡 In Progress
🔵 Planned
⚪ Idea / Untimed

## v0.x - Foundation 🟡

- [x] Basic setup
- [x] Integrate `minotaur`
- [x] Integrate `pilgrim`
- [x] Integrate `orion`
- [ ] Integrate `colossus`
- [ ] Integrate `nomad`
    - [ ] For `nomad`'s cosmic might want to use [cosmic-manager](https://github.com/HeitorAugustoLN/cosmic-manager)

## v1.x - Nix Toolings 🟡

- [x] Setup GitHub Actions, maybe use `nix-github-actions` from [GitHub](https://github.com/nix-community/nix-github-actions)
- [x] Integrate Statix: [Statix by Molybdenum Software on GitHub](https://github.com/molybdenumsoftware/statix)
- [x] Install Nix-Melt: [Nix-Melt by Nix Community on GitHub](https://github.com/nix-community/nix-melt)
- [x] Install Optnix: [Their Website](https://optnix.snare.dev/)
- [x] Install nh: [NH on GitHub from Nix Community](https://github.com/nix-community/nh)
- [ ] Integrate nixdoc: [nixdoc on GitHub](https://github.com/nix-community/nixdoc)
- [ ] Consider [steam-config-nix](https://different-name.github.io/steam-config-nix/docs/) for declarative steam configuration
- [ ] Integrate [korora](https://github.com/adisbladis/korora) and [adios](https://github.com/adisbladis/adios)
- [ ] Check [haumea](https://github.com/nix-community/haumea) and maybe integrate
- [ ] Make gaming work perfectly and seamlessly
    - [ ] Consider [maccel](https://github.com/Gnarus-G/maccel)
    - [ ] MC w/ [nix-minecraft](https://github.com/Infinidoge/nix-minecraft)
- [ ] See [Omnibin](https://github.com/fzakaria/omnibin)
- [ ] Check out [Clan's](https://clan.lol/) stuff
- [ ] Find a foss TTS and STT sol'n and integrate it
    - [ ] Maybe [habla](https://github.com/Baitinq/habla)

## v2.x

- [ ] Get `wyrten` to work correctly
- [ ] Figure out why setup is difficult with `guix` and `imba` derivations
- [ ] Proper `Elvish` and `ZSH` configs
- [ ] Document and QoL [nixtants](https://github.com/givikuna/nixtants)
- [ ] Complete and use [nixboxd](https://github.com/givikuna/nixboxd)
- [ ] Document and QoL [gitboy](https://github.com/givikuna/gitboy)
- [ ] Document and QoL [ynternals](https://github.com/givikuna/ynternals)
- [ ] Write README.md files for every major module/folder & document as much of the codebase as possible
- [ ] Set up a `devenv` environment to work on the configuration in to eliminate global package pollution
    - [ ] Consider [git-hooks.nix](https://github.com/cachix/git-hooks.nix)
- [ ] Crawler blocking with [ai.robots.txt](github.com/ai-robots-txt/ai.robots.txt)
- [ ] Modernize Shell
    - [ ] Get a time tracker app
    - [ ] Radio tool [radio](https://github.com/pinpox/radio)
    - [ ] [gosect](https://github.com/badele/gosect)
    - [x] [hexyl](https://github.com/sharkdp/hexyl)
    - [x] [grex](https://github.com/pemistahl/grex)
    - [x] [sd](https://github.com/chmln/sd)
    - [x] [tealdeer](https://github.com/tealdeer-rs/tealdeer) and [tldr](https://github.com/tldr-pages/tldr)
    - [ ] [pipr](https://github.com/elkowar/pipr)
    - [x] [choose](https://github.com/theryangeary/choose)
    - [x] [qsv](https://github.com/dathere/qsv)
    - [x] [pueue](https://github.com/Nukesor/pueue)
    - [x] [dog](https://github.com/ogham/dog)
    - [x] [difftastic](https://github.com/Wilfred/difftastic/)
    - [x] [dua](https://github.com/Byron/dua-cli)
    - [x] [fclones](https://github.com/pkolaczk/fclones)
    - [x] [lemmeknow](https://github.com/swanandx/lemmeknow)
    - [x] [dysk](https://github.com/Canop/dysk)
    - [x] [ripsecrets](https://github.com/sirwart/ripsecrets)
    - [x] [watchexec](https://github.com/watchexec/watchexec)
    - [x] [xh](https://github.com/ducaale/xh)
    - [ ] [rargs](https://github.com/lotabout/rargs)
    - [x] [mdBook](https://github.com/rust-lang/mdBook)
    - [ ] [counts](https://github.com/nnethercote/counts)
    - [x] [delta](https://github.com/dandavison/delta)
    - [ ] [ffsend](https://github.com/timvisee/ffsend)
    - [ ] [fselect](https://github.com/jhspetersson/fselect)
    - [x] [git-cliff](https://github.com/orhun/git-cliff)
    - [ ] [gptman](https://github.com/rust-disk-partition-management/gptman)
    - [x] [himalaya](https://github.com/pimalaya/himalaya)
    - [x] [gping](https://github.com/orf/gping)
- [ ] Set up [vulnix](https://github.com/nix-community/vulnix) or [nixploit](https://github.com/manic-systems/nixploit)
- [ ] Use [angrr](https://github.com/linyinfeng/angrr), [tack](https://github.com/manic-systems/tack) and [cade](https://github.com/manic-systems/cade) for better workspace mgmt
- [ ] Check out [evix](https://github.com/manic-systems/evix)
- [ ] Use [dix](https://github.com/manic-systems/dix) for the rebuild script
- [ ] Check out [durdraw](https://durdraw.org/), [pastel](https://github.com/sharkdp/pastel), and [astroterm](https://github.com/da-luce/astroterm)

## v3.x

- [ ] Extract `wyrten` into its own library
- [ ] Set up a proper CI/CD Pipeline for all computers to stay synced.
    - [ ] Possibly use [comin](https://github.com/nlewo/comin)
- [ ] Transform `orion` into a proper server
    - [ ] Check out [SrvOS](https://github.com/nix-community/srvos) for ideas
    - [ ] Maybe a virtualization system with [proxmox-nixos](https://github.com/SaumonNet/proxmox-nixos)
- [ ] Self-hosted `Forgejo` instance
- [ ] Create a private network of the seraphim network (might require a custom tool or nebula or something similar)
    - [ ] Consider using [ogygia](https://github.com/JakeHillion/ogygia-nix)
- [ ] Integrate `hammond`
- [ ] Give `colossus` a full `xfce` system
- [ ] Complete `gnomecat` for `pilgrim`
- [ ] Use [nixos-hardware](https://github.com/nixos/nixos-hardware) for better support
- [ ] Setup [musnix](https://github.com/musnix/musnix) for audio
- [ ] Set up a virtual machine management system
    - [ ] Consider [NixVirt](https://github.com/AshleyYakeley/NixVirt)
    - [ ] Maybe [micro-vm](https://github.com/microvm-nix/microvm.nix)
- [ ] Check out [NixPak](https://github.com/nixpak/nixpak) for sandboxing
- [ ] Use Manic-Systems' [nixos-core](https://github.com/manic-systems/nixos-core)
- [ ] Get a proper deployment system
    - [ ] Maybe [deploy-rs](github.com/serokell/deploy-rs)
    - [ ] For CI maybe [circus](https://github.com/manic-systems/circus)
    - [ ] Maybe set up a custom system
    - [ ] Needs a TUI at some point
    - [ ] Maybe [colmena](https://github.com/nix-community/colmena)
- [ ] Make the `nh-r` script for invoking an `nh` rebuild

## v4.x

- [ ] Integrate `nomad`
- [ ] Give `nomad` a full `XMonad` system
- [ ] Consider and set up [impermanence](https://github.com/nix-community/impermanence)
- [ ] Set up secure boot with [lanzaboote](https://github.com/nix-community/lanzaboote)
- [ ] Consider [nix-mineral](https://cynicsketch.github.io/nix-mineral/index.html) for better security
- [ ] Use [nix-alien](https://github.com/thiagokokada/nix-alien) for the weird stuff
- [ ] Set up a personal mail-server
    - [ ] Consider using [nixos-mailserver](https://gitlab.com/simple-nixos-mailserver/nixos-mailserver)
- [ ] Proper book server
    - [ ] Look at [bookdav](https://codeberg.org/suzana2314/bookdav)
- [ ] Proper formatting
    - [ ] Look at [alejandra](https://github.com/kamadorueda/alejandra)

## Parking Lot ⚪

- [ ] A nix configurable terminal-based modal editor that isn't annoying and comes with sane defaults (realistically going to make my own one)
- [ ] Translate random shell scripts to `Elvish` and `Nushell`
- [ ] Test [nix-on-droid](https://github.com/nix-community/nix-on-droid)
