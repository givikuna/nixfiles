{ pkgs, domain, ... }:
{
  services.prosody = {
    enable = true;
    admins = [ "admin@tsvari.io" ];
    plugins = with pkgs.prosodyPlugins; [
      mod_smacks
      mod_http_upload
    ];
    extraConfig = ''
      VirtualHost "${domain}"
        enabled = true
        ssl = {
          certificate = "/var/lib/acme/${domain}/fullchain.pem";
          key = "/var/lib/acme/${domain}/key.pem";
        }
    '';
    /*
      Component "conference.tsvari.io" "muc"
        name = "Chatrooms"
    */
    # should use mumble instead
  };
}
