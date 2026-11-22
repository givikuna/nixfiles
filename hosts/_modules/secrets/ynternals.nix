{
  inputs,
  config,
  pkgs,
  ...
}:
{
  ynternals = {
    enable = true;
    file = ../../../secrets.json;
  };

  environment.systemPackages = [
    inputs.ynternals.packages.${pkgs.system}.default

    (pkgs.writeShellScriptBin "ynternals-secret-test" ''
      echo "secret: $(sudo cat ${config.ynternals.secrets.testing-secret})"
    '')
  ];

  systemd.tmpfiles.settings."10-ynternals-key"."/etc/nixos/symmetric.key".z = {
    mode = "0600";
    user = "givik";
    group = "users";
  };
}
