{
  pkgs,
  lib,
  ...
}: {
  # waydroid
  virtualisation.waydroid.enable = true;

  # distrobox
  # (stores files in ~/.local/share/containers/storage)
  # 1: distrobox create --name arch --image archlinux
  # 2: distrobox enter arch
  # 3: distrobox stop arch
  # 4: distrobox rm arch
  environment.defaultPackages = [pkgs.distrobox];
  hardware.nvidia-container-toolkit.enable = true;
  virtualisation.podman = {
    enable = true;
  };

  # docker
  # virtualisation.docker = {
  #   package = pkgs.docker;
  #   enable = true;
  #   storageDriver = "btrfs";
  #   enableOnBoot = false;
  #   daemon = {
  #     settings = {
  #       data-root = "/var/lib/docker";
  #     };
  #   };
  #   rootless = {
  #     enable = true;
  #     setSocketVariable = true;
  #   };
  # };

  # qemu
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
