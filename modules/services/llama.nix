{ pkgs, ... }:

{
  services.llama-cpp = {
    enable = true;
    package = pkgs.llama-cpp.override { vulkanSupport = true; };
    settings = {
      model = "/local_ai/Qwen3.8-27B-UD-Q4_K_S.gguf";
      host = "0.0.0.0";
      port = 8080;
      n-gpu-layers = 50;
      ctx-size = 32768;
      jinja = true;
    };
  };
}