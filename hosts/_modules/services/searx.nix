{ ... }: {
  services.searx = {
    enable = true;

    redisCreateLocally = true;
    settings.server = {
      bind_address = "::1";
    };

    limiterSettings = {
      real_ip = {
        x_for = 1;
        ipv4_prefix = 32;
        ipv6_prefix = 56;
      };

      botdetection = {
        ip_limit = {
          filter_link_local = true;
          link_token = true;
        };
      };
    };

    runInUwsgi = true;

    uwsgiConfig = {
      socket = "/run/searx/searx.sock";
      http = ":8888";
      chmod-socket = "660";
    };
  };
}
