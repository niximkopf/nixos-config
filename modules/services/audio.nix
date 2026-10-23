{ pkgs, lib, ... }:

{
    services = {
    mpd = {
      enable = true;
      user = "niximkopf";
      settings = {
        music_directory = "/home/niximkopf/Music/Playlists";
        audio_output = [
          { type = "pipewire"; name = "PipeWire"; }
          { type = "fifo"; name = "Cava FIFO"; path = "/tmp/mpd.fifo"; format = "44100:16:2"; }
        ];
      };
    };

    pipewire = {
      enable        = true;
      alsa.enable   = true;
      alsa.support32Bit = true;
      pulse.enable  = true;
      jack.enable   = true;
    };
    pulseaudio.enable = false;
  };
  systemd.services.mpd.environment.XDG_RUNTIME_DIR = "/run/user/1000";
}