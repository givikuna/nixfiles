{ nixosConfigurations, ... }:
let
  cfg = nixosConfigurations.nomad.config;
in
{
  suites."Nomad: Evaluation" = {
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
