{ pkgs, ... }: {

  boot = {
    
    # choose custom kernel
    kernelPackages = pkgs.linuxPackages;

  };

}
