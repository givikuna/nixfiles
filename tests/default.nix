{
  pkgs,
  lib,
  hosts,
  inputs,
  ...
}:
let
  callTest =
    testPath: hostname: username:
    import testPath {
      inherit
        pkgs
        hostname
        inputs
        username
        ;
      hostModule = ../hosts/${hostname}/configuration.nix;
    };

  commonFiles = builtins.attrNames (builtins.readDir ./tests/common);
  commonTestNames = map (lib.removeSuffix ".nix") (lib.filter (lib.hasSuffix ".nix") commonFiles);

  buildTestsFor =
    hostname:
    let
      username = hosts.${hostname}.username or "givik";

      commonSet = lib.genAttrs commonTestNames (
        testName: callTest ./tests/common/${testName}.nix hostname username
      );

      hostOptInFile = ./hosts/${hostname}.nix;
      specialTestNames = if builtins.pathExists hostOptInFile then import hostOptInFile else [ ];

      specialSet = lib.genAttrs specialTestNames (
        testName: callTest ./tests/special/${testName}.nix hostname
      );

      allHostTests = commonSet // specialSet;
    in
    lib.mapAttrs' (name: test: lib.nameValuePair "${hostname}-${name}" test) allHostTests;

in
lib.foldl' (acc: host: acc // buildTestsFor host) { } (builtins.attrNames hosts)
