{ config, pkgs, inputs, ... }: {

  # import drivers for ga402x asus laptop
  imports = [
    inputs.nixos-hardware.nixosModules.asus-zephyrus-ga402x-amdgpu
    inputs.nixos-hardware.nixosModules.asus-zephyrus-ga402x-nvidia
  ];

  # xserver gpu
  services.xserver.videoDrivers = [ "nvidia" ];

  # proprietary drivers are faster
  hardware.nvidia.open = false;

  # other
  hardware = {
    firmware = [ pkgs.firmwareLinuxNonfree ];
    enableAllFirmware = true;
    nvidia-container-toolkit.enable = true;
    #graphics = {
    #  enable = true;
    #  enable32Bit = true;
    #  extraPackages = [ pkgs.stable.rocmPackages.clr.icd ];
    #};
  };

}
