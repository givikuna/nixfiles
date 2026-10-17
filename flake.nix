{
  description = "all hail richard stallman";

  inputs = {
    # ============================================
    #                     SYSTEM
    # ============================================

    # nixpkgs themselves
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # hm
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # flake mgmt
    # flake-utils.url = "github:numtide/flake-utils";

    # determinate nix
    # determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";

    # version pinning
    multiverse.url = "github:fzakaria/nixpkgs-multiverse";

    # gitboy
    gitboy.url = "github:givikuna/gitboy";
    gitboy.inputs.nixpkgs.follows = "nixpkgs";

    # unit testing
    nixtest.url = "gitlab:TECHNOFAB/nixtest?dir=lib";

    # asymmetric secrets
    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

    # symmetric secrets
    ynternals.url = "git+https://codeberg.org/giviko/ynternals";

    # nixtants
    nixtants.url = "git+https://codeberg.org/giviko/nixtants";

    # disko
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    # formatting
    alejandra.url = "github:kamadorueda/alejandra/4.0.0";
    alejandra.inputs.nixpkgs.follows = "nixpkgs";

    # script maker
    mk-script.url = "github:givikuna/nix-mkScript";

    # chaotic nyx
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    # kernel mgmt
    ysyldur.url = "git+https://codeberg.org/giviko/ysyldur";
    ysyldur.inputs.chaotic.follows = "chaotic";

    # gleam->nix
    # glistix.url = "github:Glistix/glistix";
    # glistix.inputs.nixpkgs.follows = "nixpkgs";

    # evix
    evix.url = "github:manic-systems/evix";

    # ogygia
    ogygia.url = "github:JakeHillion/ogygia-nix";

    #

    #

    #

    #

    #

    # ============================================
    #                  REPOSITORIES
    # ============================================

    # flatpaks
    nix-flatpak.url = "github:gmodena/nix-flatpak";

    # nix user repository
    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";

    # guix
    guixpkgs.url = "github:fzakaria/guixpkgs";

    # ekala-project corepkgs
    ekapkgs.url = "github:ekala-project/corepkgs";

    #

    #

    #

    #

    #

    # ============================================
    #                  PACKAGES
    # ============================================

    # ripgrep
    rip.url = "github:cesarferreira/rip";
    rip.inputs.nixpkgs.follows = "nixpkgs";

    # anubis-fetch
    anubis-fetch.url = "github:fzakaria/anubis-fetch";

    # discord
    nixcord.url = "github:FlameFlag/nixcord";

    # zen browser
    # zen-browser.url = "github:youwen5/zen-browser-flake";
    # zen-browser.inputs.nixpkgs.follows = "nixpkgs";

    # davinci
    davinci.url = "git+https://git.voidarc.co.uk/voidarc/nixos.davinci";

    # nix-topology
    nix-topology.url = "github:oddlama/nix-topology";

    # rewindvm
    rewind.url = "github:fzakaria/rewindvm";

    # gh-api-cli
    gh-api-cli.url = "github:givikuna/gh-api-cli";

    #

    #

    #

    #

    #

    # ============================================
    #                     AI
    # ============================================

    # ai sandboxing
    agent-sandbox.url = "github:archie-judd/agent-sandbox.nix";
    agent-sandbox.inputs.nixpkgs.follows = "nixpkgs";

    #

    #

    #

    #

    #

    # ============================================
    #                  GAMING
    # ============================================

    # nix-gaming
    nix-gaming.url = "github:fufexan/nix-gaming";

    # sls-steam
    sls-steam.url = "github:AceSLS/SLSsteam";
    sls-steam.inputs.nixpkgs.follows = "nixpkgs";
  };

  #

  #

  #

  outputs =
    { self, ... }@args:
    let
      inputs = removeAttrs args [ "self" ];
    in
    import ./flake-modules/outputs.nix { inherit inputs self; };
}
