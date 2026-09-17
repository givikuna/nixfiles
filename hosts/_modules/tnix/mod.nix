{ pkgs, inputs, ... }: {
  environment.systemPackages = with inputs.tnix.packages.${pkgs.system}; [
    tnix
    tnix-lsp
  ];
}
