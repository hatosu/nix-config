{ config, pkgs, ... }: {

  powerManagement.cpuFreqGovernor = "performance";
  services.xserver.videoDrivers = [ "nvidia" ];
  boot.kernelModules = [ "nvidia_uvm" "nvidia_modeset" "nvidia_drm" "nvidia" ];
  boot.kernelParams = [ "nvidia-drm.modeset=1" "nvidia-drm.fbdev=1" ];
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      nvidiaPersistenced = true;
      open = false;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      dynamicBoost.enable = false;
      nvidiaSettings = false;
    };
  };

}
