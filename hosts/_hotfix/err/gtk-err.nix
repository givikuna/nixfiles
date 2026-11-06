{ ... }: {
  nixpkgs.config = {
    problems.handlers = {
      "gtk+".broken = "warn";
    };
  };
}
