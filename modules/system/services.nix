{ pkgs, lib,  ... }:

{
  services = {
    gvfs.enable = true;
    hardware.openrgb.enable = true;
    power-profiles-daemon.enable = true;
    upower.enable = true;
  };

  security.rtkit.enable = true;

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

  # ── GPU Passthrough (später einrichten) ──────────────────────
  # virtualisation.libvirtd.enable = true;
  # virtualisation.libvirtd.qemu.ovmf.enable = true;
  # boot.kernelParams = [ "amd_iommu=on" "iommu=pt" ];
  # boot.kernelModules = [ "vfio" "vfio_iommu_type1" "vfio_pci" ];
}
