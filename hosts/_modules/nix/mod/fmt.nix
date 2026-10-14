{ inputs, ... }: {
  environment.systemPackages = [
    inputs.alejandra.defaultPackage.x86_64-linux
  ];
}
