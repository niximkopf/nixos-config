{ pkgs, lib, ... }:

{
  # ── GPU Passthrough (später einrichten) ──────────────────────
  # virtualisation.libvirtd.enable = true;
  # virtualisation.libvirtd.qemu.ovmf.enable = true;
  # boot.kernelParams = [ "amd_iommu=on" "iommu=pt" ];
  # boot.kernelModules = [ "vfio" "vfio_iommu_type1" "vfio_pci" ];
}