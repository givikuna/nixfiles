{ nixosConfigurations, ... }:

{
  suites."Minotaur: Evaluation" = {
    pos = __curPos;
    tests = [
      {
        name = "builds-toplevel-successfully";
        type = "unit";
        expected = true;
        actual = nixosConfigurations.minotaur.config.system.build.toplevel != null;
      }
    ];
  };
}
