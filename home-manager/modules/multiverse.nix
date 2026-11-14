{
  lib,
  groups,
  ...
}:
lib.mkIf groups.multiversers {
  multiverse = {
    enable = true;

    pins = {
      typescript-language-server = "5.3.0";
    };
  };
}
