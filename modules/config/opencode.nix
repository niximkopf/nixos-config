{ pkgs, ... }:

{
  programs.opencode = {
    enable = true;

    settings = {
      model = "llamacpp/qwen3.8-27b";

      providers.llamacpp = {
        name = "llama.cpp (lokal)";
        package = "@opencode/ai/providers/openai-compatible";
        settings.baseURL = "http://127.0.0.1:8080/v1";

        models."qwen3.8-27b" = {
          name = "Qwen3.8 27B (Q4_K_S)";
          modelID = "/local_ai/Qwen3.8-27B-UD-Q4_K_S.gguf";
          capabilities.tools = true;
          limit = {
            context = 32768;
            output = 8192;
          };
        };
      };
    };
  };
}