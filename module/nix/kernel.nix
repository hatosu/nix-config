{ pkgs, ... }: {

  # choose custom kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

}
