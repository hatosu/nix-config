{ pkgs, lib, ...}: {

  # waydroid
  virtualisation.waydroid.enable = true;

  # distrobox (https://wiki.archlinux.org/title/Distrobox# Usage)
  environment.systemPackages = [ pkgs.distrobox ];
  hardware.nvidia-container-toolkit.enable = true;
  virtualisation.podman = {
    enable = true;
    #dockerCompat = true;
  };

  # docker
  virtualisation.docker = {
    package = pkgs.docker;
    enable = true;
    storageDriver = "btrfs";
    daemon = {
      settings = {
        data-root = "/dock";
      };
    };
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  # qemu
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
