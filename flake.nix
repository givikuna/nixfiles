{
  description = "all hail richard stallman";

  inputs = {
    # ============================================
    #                     SYSTEM
    # ============================================

    # asymmetric secrets
    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

    # symmetric secrets
    # ynternals.url = "git+https://codeberg.org/giviko/ynternals";
    ynternals.url = "github:givikuna/ynternals";

    # chaotic nyx
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    # kernel mgmt
    ysyldur.url = "git+https://codeberg.org/giviko/ysyldur";
    ysyldur.inputs.chaotic.follows = "chaotic";

    # evix
    evix.url = "github:manic-systems/evix";

    # ogygia
    ogygia.url = "github:JakeHillion/ogygia-nix";

    # flake mgmt
    # flake-utils.url = "github:numtide/flake-utils";

    # determinate nix
    # determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";

    #

    #

    #

    #

    #

    # ============================================
    #                CONFIG MGMT
    # ============================================

    # script maker
    mk-script.url = "github:givikuna/nix-mkScript";

    # version pinning
    multiverse.url = "github:fzakaria/nixpkgs-multiverse";

    # gitboy
    gitboy.url = "github:givikuna/gitboy";
    gitboy.inputs.nixpkgs.follows = "nixpkgs";

    # nixtants
    nixtants.url = "git+https://codeberg.org/giviko/nixtants";

    # disko
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    # hm
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # unit testing
    nixtest.url = "gitlab:TECHNOFAB/nixtest?dir=lib";

    #

    #

    #

    #

    #

    # ============================================
    #                    DESKTOP
    # ============================================

    plasma-manager.url = "github:nix-community/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";

    ryoku.url = "github:Ryoku-dev/Ryoku-on-NixOS";

    cosmic-manager.url = "github:HeitorAugustoLN/cosmic-manager";
    cosmic-manager.inputs.nixpkgs.follows = "nixpkgs";
    cosmic-manager.inputs.home-manager.follows = "home-manager";

    #

    #

    #

    #

    #

    # ============================================
    #                  REPOSITORIES
    # ============================================

    # nixpkgs themselves
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # flatpaks
    nix-flatpak.url = "github:gmodena/nix-flatpak";

    # gvpkgs
    gvpkgs.url = "github:givikuna/gvpkgs";

    # guix
    guixpkgs.url = "github:fzakaria/guixpkgs";

    # ekala-project corepkgs
    ekapkgs.url = "github:ekala-project/corepkgs";

    # nix user repository
    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";

    #

    #

    #

    #

    #

    # ============================================
    #                   HARDWARE
    # ============================================

    # l5p-keyboard-rgb.url = "github:4JX/L5P-Keyboard-RGB";
    # l5p-keyboard-rgb.inputs.nixpkgs.follows = "nixpkgs";

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

    # resumeworks
    resumeworks.url = "github:givikuna/resumeworks";

    # zptr
    zptr.url = "github:givikuna/zptr";

    # aigest
    aigest.url = "github:givikuna/aigest";
    aigest.inputs.nixpkgs.follows = "nixpkgs";

    # formatting
    alejandra.url = "github:kamadorueda/alejandra/4.0.0";
    alejandra.inputs.nixpkgs.follows = "nixpkgs";

    # gleam->nix
    # glistix.url = "github:Glistix/glistix";
    # glistix.inputs.nixpkgs.follows = "nixpkgs";

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
