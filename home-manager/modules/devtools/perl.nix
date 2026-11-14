{
  pkgs,
  ...
}:
{
  home.packages =
    with pkgs;
    (
      [
        perl
      ]
      ++ (with perlPackages; [
        PerlLanguageServer
        PerlTidy
        PerlCritic
      ])
    );
}
