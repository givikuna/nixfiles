{
  pkgs,
  ...
}:
{
  services.ollama = {
    enable = true;
    package = with pkgs; ollama-cuda;

    loadModels = [
      "llama3.1"
      "qwen2.5-coder"
      "llama3.2-vision"
      "qwen2-math"
    ];
  };

  environment.systemPackages = with pkgs; [
    ollama
  ];
}
