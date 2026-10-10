{ ... }: {
  multiverse = {
    enable = true;

    config = {
      allowUnfree = true;
    };

    pins = {
      ollama = "0.40.0";
      ollama-cuda = "0.40.0";
    };
  };
}
