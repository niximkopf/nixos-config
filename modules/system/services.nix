{ pkgs, lib,  ... }:

{
  services = {
    gvfs.enable = true;
    hardware.openrgb.enable = true;
    power-profiles-daemon.enable = true;
    upower.enable = true;
  };

  hardware = {
    graphics = {
      enable      = true;
      enable32Bit = true;
    };
    bluetooth = {
      enable      = true;
      powerOnBoot = true;
    };
    enableAllFirmware = true;
    enableRedistributableFirmware = true;
  };
}
