{
  nixtants,
  pkgs,
  username,
  ...
}:
let
  git-user = nixtants.users.${username}.github.username;
  git-email = nixtants.users.${username}.github.email;
in
{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    userName = git-user;
    userEmail = git-email;

    settings = {
      core = {
        pager = "delta";
      };

      interactive.diffFilter = "delta --color-only";
      delta.navigate = true;
      merge.conflictstyle = "zdiff3";

      http.sslCAInfo = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";
    };
  };
}
