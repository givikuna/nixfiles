{ nixosConfigurations, ... }:
let
  cfg = nixosConfigurations.pilgrim.config;
in
{
  suites."Pilgrim: Evaluation" = {
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
