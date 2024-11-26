{ pkgs, lib, ... }:
{

  # waydroid
  virtualisation.waydroid.enable = true;

  # distrobox (https://wiki.archlinux.org/title/Distrobox# Usage)
  environment.defaultPackages = [ pkgs.distrobox ];
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
    enableOnBoot = false;
    daemon = {
      settings = {
        data-root = "/var/lib/docker";
      };
    };
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
    #extraPackages = let
    #  arch = pkgs.dockerTools.buildImage {
    #    name = "archlinux";
    #    tag = "latest";
    #    diskSize = 30000; #megabytes
    #    buildVMMemorySize = 2000; #megabytes
    #  };
    #in with pkgs; [ arch ];
  };

  # qemu
  #environment.systemPackages = [ pkgs.nixvirt ];
  #services.spice-vdagentd.enable = true;
  #programs.virt-manager.enable = true;
  #virtualisation = {
  #  libvirtd = {
  #    enable = true;
  #    qemu = {
  #      swtpm.enable = true;
  #      ovmf.enable = true;
  #      ovmf.packages = [ pkgs.OVMFFull.fd ];
  #    };
  #  };
  #  spiceUSBRedirection.enable = true;
  #};

}
