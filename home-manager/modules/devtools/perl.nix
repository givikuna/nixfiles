{ pkgs, ... }: {
  home.packages = with pkgs; [
    perl
    perlPackages.PerlLanguageServer
    perlPackages.PerlTidy
    perlPackages.PerlCritic
  ];
}
