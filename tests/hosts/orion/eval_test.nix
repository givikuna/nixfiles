{ nixosConfigurations, ... }:
let
  cfg = nixosConfigurations.orion.config;
in
{
  suites."Orion: Evaluation" = {
    pos = __curPos;
    tests = [
      {
        name = "builds-toplevel-successfully";
        type = "unit";
        expected = true;
        actual = cfg.system.build.toplevel != null;
      }
    ];
  };
}
