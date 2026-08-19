{ ... }:
{
  services.fail2ban = {
    enable = true;
    jails = {
      nginx-http-auth = ''
        enabled = true
        filter = nginx-http-auth
        port = http,https
        logpath = /var/log/nginx/access.log
        maxretry = 5
        bantime = 3600
      '';
      synapse = ''
        enabled = true
        filter = matrix-synapse
        logpath = /var/lib/matrix-synapse/homeserver.log
        maxretry = 5
        bantime = 3600
      '';
      prosody = ''
        enabled = true
        filter = prosody
        logpath = /var/log/prosody/prosody.log
        maxretry = 5
        bantime = 3600
      '';
    };
  };
}
