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

    # secrets
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    # gitboy
    gitboy.url = "github:givikuna/gitboy";
    gitboy.inputs.nixpkgs.follows = "nixpkgs";

    # unit testing
    nixtest.url = "gitlab:TECHNOFAB/nixtest?dir=lib";

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

    #

    #

    #

    #

    #

    # ============================================
    #                  PACKAGES
    # ============================================

    # movie/tv/anime terminal viewer
    gonwatch.url = "github:kbwhodat/gonwatch/main";
    gonwatch.inputs.nixpkgs.follows = "nixpkgs";

    # ripgrep
    rip.url = "github:cesarferreira/rip";
    rip.inputs.nixpkgs.follows = "nixpkgs";

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

    agent-sandbox.url = "github:archie-judd/agent-sandbox.nix";
    agent-sandbox.inputs.nixpkgs.follows = "nixpkgs";
  };

  #

  outputs = inputs: import ./flake-modules/outputs.nix { inherit inputs; };
}
