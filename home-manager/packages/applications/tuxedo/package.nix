{
  pkgs,
  lib,
  config,
  ...
}:
lib.mkIf config.my.apps.tuxedo {
  home.packages = [
    (pkgs.rustPlatform.buildRustPackage {
      pname = "tuxedo";
      version = "2026.5.12";

      src = pkgs.fetchFromGitHub {
        owner = "webstonehq";
        repo = "tuxedo";
        tag = "v2026.5.12";
        hash = "sha256-s4GIHq4kjj+FiNBJJjWeXmg4f40ARUILzwsEl0CDV1o=";
      };

      cargoHash = "sha256-rIdjrwNuY0DySdk4jc880JrFgoIuKTYEcx6XoSfllp4=";

      preCheck = ''
        export HOME="$TMPDIR/home"
        export XDG_CONFIG_HOME="$TMPDIR/config"
        export XDG_CACHE_HOME="$TMPDIR/cache"
        export XDG_STATE_HOME="$TMPDIR/state"
        mkdir -p "$HOME" "$XDG_CONFIG_HOME" "$XDG_CACHE_HOME" "$XDG_STATE_HOME"
      '';

      checkFlags = [
        "--skip=insert_dialog_after_nl_parse"
      ];

      meta = with lib; {
        description = "fast, keyboard-driven terminal UI for todo.txt";
        homepage = "https://github.com/webstonehq/tuxedo";
        license = licenses.mit;
        mainProgram = "tuxedo";
      };
    })
  ];
}
