{ pkgs, ... }:

{
  services.llama-cpp = {
    enable = true;
    package = pkgs.llama-cpp.override { vulkanSupport = true; };
    model = "";
    host = "127.0.0.1";
    port = 8080;
    extraFlags = [ "-ngl" "50" "-c" "16384" "--jinja" ];
  };
}