{ pkgs, inputs, ... }:

let
  gonwatch-patched = inputs.gonwatch.packages.${pkgs.system}.default.overrideAttrs (oldAttrs: {
    doCheck = false;
  });

  ani-cli-git = pkgs.ani-cli.overrideAttrs (oldAttrs: {
    src = pkgs.fetchFromGitHub {
      owner = "pystardust";
      repo = "ani-cli";
      rev = "master";
      hash = "sha256-OyCKDN89sBz59+3JncMDyNOq8UMqqjara+A0Owo3oko=";
    };
  });
in
{
  home.packages = [
    ani-cli-git
    gonwatch-patched
  ];
}
