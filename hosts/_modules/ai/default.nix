{
  config,
  ...
}:
{
  imports = [
    ../_meta/multiverse/ollama.nix
  ];

  services.ollama = {
    enable = true;
    package = config.multiverse.pinned.ollama-cuda;

    loadModels = [
      "llama3.1"
      "qwen2.5-coder"
      "llama3.2-vision"
      "qwen2-math"
    ];
  };

  environment.systemPackages = [
    config.multiverse.pinned.ollama
  ];
}
