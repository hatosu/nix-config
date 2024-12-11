{ pkgs, ... }: {

  # setup steam
  programs.gamemode.enable = true;
  environment.defaultPackages = with pkgs; [pinned.mangohud];
  programs.steam = {
    package = pkgs.latest.steam;
    enable = true;
    extraPackages = with pkgs; [latest.gamescope];
    extraCompatPackages = with pkgs; [latest.proton-ge-bin];
    protontricks.enable = true;
  };

  # game packages
  environment.systemPackages = with pkgs; [
    minecraft
    cemu
    wiiudownloader
    stable.xivlauncher
    latest.shadps4
    latest.ryujinx
    (import (fetchFromGitHub {
      owner = "NixOS";
      repo = "nixpkgs";
      rev = "46fbd894a87c6b9e64c22d8a4c462b90d1438dcb";
      sha256 = "sha256-U5R0VmNoAZz8N+xyTDteXT8yaZYUG4mKc61cGMNGwiA=";
    }){system = "x86_64-linux";}).yuzu
  ];

  # vr option 1
  programs.alvr = {
    package = pkgs.latest.alvr;
    enable = true;
    openFirewall = true;
  };

  # vr option 2
  # services.wivrn = {
  #   package = pkgs.latest.wivrn;
  #   enable = true;
  #   openFirewall = true;
  #   defaultRuntime = true; # this doesnt currently support proton?
  #   autoStart = true;
  #   # Config for WiVRn (https://github.com/WiVRn/WiVRn/blob/master/docs/configuration.md)
  #   config = {
  #     enable = true;
  #     json = {
  #       # 1.0x foveation scaling
  #       scale = 1.0;
  #       # 100 Mb/s
  #       bitrate = 100000000;
  #       encoders = [
  #         {
  #           encoder = "vaapi";
  #           codec = "h265";
  #           # 1.0 x 1.0 scaling
  #           width = 1.0;
  #           height = 1.0;
  #           offset_x = 0.0;
  #           offset_y = 0.0;
  #         }
  #       ];
  #     };
  #   };
  # };

  # support for xbox controller usb dongle
  hardware.xone.enable = true;
}
