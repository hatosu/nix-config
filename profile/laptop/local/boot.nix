{pkgs, ...}: { boot = {
    
  loader = {

    efi = {
      canTouchEfiVariables = true;
    };
    
    grub = {
      enable = true;
      efiSupport = true;
      theme = pkgs.nixos-grub2-theme;
    };
  
  };

  kernelPackages = pkgs.linuxPackages_latest; # backup: pkgs.latest.linuxPackages;

};}
