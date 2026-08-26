{ pkgs, username, ... }:
let
  git-user = builtins.readFile ../../../../../data/users/${username}/git/gitUsername.txt;
  git-email = builtins.readFile ../../../../../data/users/${username}/git/gitEmail.txt;
in
{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    userName = git-user;
    userEmail = git-email;

    settings = {
      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
      delta.navigate = true;
      merge.conflictstyle = "zdiff3";

      http.sslCAInfo = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
    };
  };
}
