{
  nixtants,
  pkgs,
  username,
  ...
}:
let
  git-user = nixtants.users.${username}.github.username;
  git-email = nixtants.users.${username}.github.email;
  cb-user = nixtants.users.${username}.codeberg.username;
in
{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    settings = {
      user = {
        name = git-user;
        email = git-email;
      };

      core = {
        pager = "delta";
      };

      interactive.diffFilter = "delta --color-only";
      delta.navigate = true;
      merge.conflictstyle = "zdiff3";

      http.sslCAInfo = "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt";

      credential."https://github.com" = {
        helper = "${pkgs.writeShellScript "gh-credential-helper" ''
          if [ "$1" = "get" ]; then
            echo "username=${git-user}"
            echo "password=$(cat /run/ynternals/gh_ghp)"
          fi
        ''}";
      };

      credential."https://codeberg.org" = {
        helper = "${pkgs.writeShellScript "cb-credential-helper" ''
          if [ "$1" = "get" ]; then
            echo "username=${cb-user}"
            echo "password=$(cat /run/ynternals/cb_pass)"
          fi
        ''}";
      };
    };
  };
}
