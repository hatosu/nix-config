{ inputs, lib, config, pkgs, ... }: {
  
  imports = [

    # import hardware.nix, package.nix, and home.nix
    ./hardware-configuration.nix
    ./package.nix
    inputs.home-manager.nixosModules.default

    # import modules
    inputs.self.nixosModules.kernel
    inputs.self.nixosModules.session
    inputs.self.nixosModules.audio
    inputs.self.nixosModules.font
    inputs.self.nixosModules.game
    inputs.self.nixosModules.secure
    inputs.self.nixosModules.variable
    inputs.self.nixosModules.virtualization
    inputs.self.nixosModules.keyboard
    inputs.self.nixosModules.init
    inputs.self.nixosModules.alias
    inputs.self.nixosModules.function
    inputs.self.nixosModules.impermanence
    inputs.self.nixosModules.music

  ];

  nixpkgs = { config = { allowUnfree = true; allowBroken = true; };
    overlays = [

      # import overlays
      inputs.self.overlays.additions
      inputs.self.overlays.modifications
      inputs.self.overlays.stable-packages
    
    ];
  };

  nix = let flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs; in { settings = {

      # enable experimental features
      experimental-features = [ "nix-command" "flakes" ];

      # disable global registry
      flake-registry = "";

      # workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
    
    };

    # auto-collect nix garbage
    gc = {
      dates = "daily";
      options = "--delete-older-than 1d";
      automatic = true;
    };

    # auto-optimize /nix/store
    optimise = {
      dates = [ "daily" ];
      automatic = true;
    };

    # disable channels
    channel.enable = false;

    # make flake registry and nix path match flake inputs
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;

  };

  # define hostname
  networking.hostName = "nixos";

  # setup hatosu as user
  users.users.hatosu = {
    isNormalUser = true;
    home = "/home/hatosu";
    description = "guh... mlem -hatosu";
    extraGroups = [ "wheel" "libvirtd" "kvm" ];
    initialPassword = ";";
  };

  # setup bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # limit number of generations to 100
  boot.loader.systemd-boot.configurationLimit = 100;

  # properly set default locale
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  # setup timezone
  time.timeZone = "America/Los_Angeles";

  # setup network manager
  networking.networkmanager.enable = true;

  # setup firewall
  networking.firewall.enable = true;

  # set zsh as default shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # fuse
  programs.fuse.userAllowOther = true;

  # login
  programs.hyprland.enable = true;
  services.displayManager.ly.enable = true;

  # gpu
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

  # homemanager stuff
  home-manager = {
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; };
    users = {
      "hatosu" = import ./home.nix;
    };
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";

}
