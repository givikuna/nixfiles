{
  inputs,
  ...
}:
{
  home.packages = [
    inputs.davinci.packages.x86_64-linux.default
  ];
}
