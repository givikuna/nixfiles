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
- [ ] See [NuschtOS Search](https://github.com/NuschtOS/search)
- [ ] See [Omnibin](https://github.com/fzakaria/omnibin)
- [ ] Check out [Clan's](https://clan.lol/) stuff
- [ ] Find a foss TTS sol'n and integrate it

## v2.x

- [ ] Get `wyrten` to work correctly
- [ ] Figure out why setup is difficult with `guix` and `imba` derivations
- [ ] Proper `Elvish` and `ZSH` configs
- [ ] Document and QoL [nixtants](https://github.com/givikuna/nixtants)
- [ ] Complete and use [nixboxd](https://github.com/givikuna/nixboxd)
- [ ] Document and QoL [gitboy](https://github.com/givikuna/gitboy)
- [ ] Document and QoL [ynternals](https://github.com/givikuna/ynternals)
- [ ] Write README.md files for every major module/folder & document as much of the codebase as possible.

## v3.x

- [ ] Extract `wyrten` into its own library
- [ ] Set up a proper CI/CD Pipeline for all computers to stay synced
- [ ] Transform `orion` into a proper server
- [ ] Self-hosted `Forgejo` instance
- [ ] Create a private network of the seraphim network (might require a custom tool)
- [ ] Integrate `hammond`
- [ ] Give `colossus` a full `xfce` system
- [ ] Complete `gnomecat` for `pilgrim`

## v4.x

- [ ] Integrate `nomad`
- [ ] Give `nomad` a full `XMonad` system

## Parking Lot ⚪

- [ ] Nicer TUI installer
- [ ] A nix configurable terminal-based modal editor that isn't annoying and comes with sane defaults (realistically going to make my own one)
- [ ] Maybe make a personal NUR for derivations made specifically for this project (it's growing a bit too fast right now)
- [ ] Translate random shell scripts to `Elvish` and `Nushell`
