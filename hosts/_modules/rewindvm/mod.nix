{ ... }: {
  programs.rewind = {
    enable = true;

    app = {
      enable = true;
    };

    amdBranchCounterWorkaround = true;
  };
}
