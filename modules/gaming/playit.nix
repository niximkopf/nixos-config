{ pkgs, lib, ... }:

{
    virtualisation.podman.enable = true;
    virtualisation.oci-containers = {
        backend = "podman";
        containers.playit = {
            image = "ghcr.io/playit-cloud/playit-agent:latest";
            extraOptions = [ "--network=host" ];
            environmentFiles = [ "/var/lib/playit/env" ];
        };
    };
}