{ pkgs, lib, ... }:

let dir = "/var/lib/dragonwilds"; in {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "steamcmd" "steam-run" "steam-original" "steam-unwrapped"
    ];

  users.groups.dragonwilds = {};
  users.users.dragonwilds = {
    isSystemUser = true;
    group = "dragonwilds";
    home = dir;
    createHome = true;
  };

  systemd.services.dragonwilds = {
    # kein wantedBy: Server startet nur, wenn du ihn startest
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    environment.HOME = dir;
    serviceConfig = {
      User = "dragonwilds";
      WorkingDirectory = dir;
      Restart = "on-failure";
      ExecStartPre = "${pkgs.steamcmd}/bin/steamcmd +force_install_dir ${dir}/server +login anonymous +app_update 4019830 validate +quit";
      ExecStart = "${pkgs.steam-run}/bin/steam-run ${dir}/server/RSDragonwilds/Binaries/Linux/RSDragonwildsServer-Linux-Shipping -log -port=7777";
    };
  };

  networking.firewall.allowedUDPPorts = [ 7777 ];

  services.logind.settings.Login.HandleLidSwitch = "ignore";
}