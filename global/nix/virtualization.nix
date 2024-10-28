{pkgs,lib,...}:{

  # enable waydroid
  virtualisation.waydroid.enable = true;

  # enable distrobox (https://wiki.archlinux.org/title/Distrobox# Usage)
  hardware.nvidia-container-toolkit.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  # enable qemu
  services.spice-vdagentd.enable = true;
  programs.virt-manager.enable = true;
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };

}
