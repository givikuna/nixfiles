{ synapse-port, ... }: {
  services.matrix-appservice-irc = {
    enable = true;
    matrixServer = "http://127.0.0.1:${toString synapse-port}";
    ircService.servers."irc.libera.chat" = {
      name = "Libera Chat";
      networkId = "libera";
      port = 6697;
      ssl = true;
    };
  };
}
