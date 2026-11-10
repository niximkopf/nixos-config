{ ... }:

{
  virtualisation = {
    docker.enable = true;
    oci-containers.backend = "docker";

    oci-containers.containers.aniworld-downloader = {
      image = "ghcr.io/phoenixthrush/aniworld-downloader:latest";
      ports = [ "127.0.0.1:8081:8080" ];
      volumes = [
        "/home/niximkopf/Videos/anime:/app/Downloads"
        "aniworld-data:/home/aniworld/.aniworld"
      ];
    };
  };
  systemd.tmpfiles.rules = [
  "d /home/niximkopf/Videos/anime 0775 1000 1000 -"
  ];
}