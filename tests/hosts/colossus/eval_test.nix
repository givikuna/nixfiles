{ nixosConfigurations, ... }:
let
  cfg = nixosConfigurations.colossus.config;
in
{
  suites."Colossus: Evaluation" = {
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
