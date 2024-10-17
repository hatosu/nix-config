{config,pkgs,inputs,...}:{

  # niri
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs.niri = { package = pkgs.niri-unstable; enable = true; };

  # gpu
  powerManagement.cpuFreqGovernor = "performance";
  services.xserver.videoDrivers = ["nvidia"];
  boot.kernelModules = [ "nvidia_uvm" "nvidia_modeset" "nvidia_drm" "nvidia" ];
  boot.kernelParams = [ "nvidia-drm.modeset=1" ];
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
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      dynamicBoost.enable = false;
      open = false;
      nvidiaPersistenced = true;
      nvidiaSettings = true;
    };
  };

}
