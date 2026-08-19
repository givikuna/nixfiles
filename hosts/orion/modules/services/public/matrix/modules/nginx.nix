{ domain, synapse-port, ... }: {
  imports = [
    ../../../../settings/nginx.nix
  ];

  services.nginx = {
    virtualHosts.${domain} = {
      enableACME = true;
      forceSSL = true;

      locations = {
        "= /.well-known/matrix/server".extraConfig = ''
          add_header Content-Type application/json;
          return 200 '{"m.server": "${domain}:443"}';
        '';

        "= /.well-known/matrix/client".extraConfig = ''
          add_header Content-Type application/json;
          add_header Access-Control-Allow-Origin "*";
          return 200 '{"m.homeserver": {"base_url": "https://${domain}"}, "m.identity_server": {"base_url": "https://vector.im"}}';
        '';

        "/" = {
          proxyPass = "http://127.0.0.1:${toString synapse-port}";
          proxyWebsockets = true;
          extraConfig = ''
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
            proxy_set_header Host $host;
            client_max_body_size 50M;
          '';
        };
      };
    };
  };
}
