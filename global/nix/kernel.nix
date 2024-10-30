{ pkgs, ... }: {

  boot = {
    
    # choose custom kernel
    kernelPackages = pkgs.linuxPackages_zen;

    # enable hibernation
    kernelParams = [ "resume_offset=533760" ];
    resumeDevice = "/dev/disk/by-label/nixos";

  };

}
