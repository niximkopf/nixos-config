{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/services.nix
    ../../modules/system/boot.nix
    ../../modules/system/nix.nix
    ../../modules/system/packages.nix
    ../../modules/system/timezone.nix
    ../../modules/system/user.nix
    ../../modules/system/fonts.nix
    ../../modules/services/asus.nix
    ../../modules/services/sddm.nix
    ../../modules/services/audio.nix
    ../../modules/services/programs.nix
    ../../modules/config/nvim.nix
    ../../modules/config/anki.nix
  ];

  networking = {
    hostName = "rog-strix";
    networkmanager.enable = true;
    firewall = {
      enable          = true;
      allowedTCPPorts = [ 53317 ];
      allowedUDPPorts = [ 53317 ];
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  boot.extraModprobeConfig = ''
    options snd_hda_intel index=1,0
  '';

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
