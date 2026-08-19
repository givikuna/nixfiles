{ ... }: {
  imports = [
    ../../../../settings/nginx.nix
  ];

  locations = {
    "/" = {
      "/" = {
        proxyPass = "http://127.0.0.1:5280"; # BOSH or WebSocket endpoint
        proxyWebsockets = true;
        extraConfig = ''
          proxy_set_header Host $host;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        '';
      };
    };
  };
}
