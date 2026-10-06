{ pkgs, ... }:

{
  users.users.niximkopf = {
    isNormalUser = true;
    shell        = pkgs.zsh;
    extraGroups  = [
      "wheel"
      "networkmanager"
      "plugdev"
      "libvirtd"
      "video"
      "audio"
    ];
  };
}
