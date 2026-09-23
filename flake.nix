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
    flake-utils.url = "github:numtide/flake-utils";

    # version pinning
    multiverse.url = "github:fzakaria/nixpkgs-multiverse";

    # typed nix
    tnix.url = "github:ubugeeei-prod/tnix";
    tnix.inputs.nixpkgs.follows = "nixpkgs";

    # gitboy
    gitboy.url = "github:givikuna/gitboy";
    gitboy.inputs.nixpkgs.follows = "nixpkgs";

    # unit testing
    nixtest.url = "gitlab:TECHNOFAB/nixtest?dir=lib";

    # asymmetric secrets
    agenix.url = "github:ryantm/agenix";
    agenix.inputs.nixpkgs.follows = "nixpkgs";

    # symmetric secrets
    ynternals.url = "github:givikuna/ynternals";

    # nixtants
    nixtants.url = "github:givikuna/nixtants";

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

    # chaotic nyx
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    # guix
    guixpkgs.url = "github:fzakaria/guixpkgs";

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
    zen-browser.url = "github:youwen5/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";

    #

    #

    #

    #

    #

    # ============================================
    #                     AI
    # ============================================

    # nixified ai
    nixified-ai.url = "github:nixified-ai/flake";

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
  };

  #

  outputs = inputs: import ./flake-modules/outputs.nix { inherit inputs; };
}
