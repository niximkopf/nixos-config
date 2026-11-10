{ pkgs, lib, ... }:

{
  hardware = {
    i2c.enable = true;
    sensor.iio.enable = true;
  };

  boot.kernelModules = [ "asus-wmi" "i2c-dev" "i2c-piix4" ];

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0b05", MODE="0666", GROUP="plugdev"
    KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
  '';
}
