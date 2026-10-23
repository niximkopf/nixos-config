{ pkgs, ... }:

{
    programs = {
        steam.enable = true;
        zsh.enable = true;
        nix-ld.enable = true;
        dconf.enable = true;
        niri.enable = true;
        gnome-disks.enable = true;
    };
}