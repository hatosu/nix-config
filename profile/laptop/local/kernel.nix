{ pkgs, inputs, ... }: {

  boot = {
    
    # choose custom kernel
    kernelPackages = pkgs.linuxPackages_zen;

  };

}
