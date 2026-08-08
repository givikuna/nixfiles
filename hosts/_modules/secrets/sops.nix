{ username, ... }:
{
  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.age.keyFile = "/home/${username}/.ssh/id_ed25519";

  # sops.secrets."lazyspotify/client_id" = { };
}
