{ config
, pkgs
, ...
}: {
  home-manager.users.hatosu.programs.obs-studio = {
    enable = true;

    package = pkgs.obs-studio;

    plugins = with pkgs.obs-studio-plugins; [
      # drivers
      obs-pipewire-audio-capture # capture pipewire audio
      obs-vkcapture # vulkan/opengl game capture
      wlrobs # allows wlroots screen capture

      # functions
      obs-multi-rtmp # stream on multiple sites at same time
      obs-tuna # song information plugin
      waveform # interactive audio graph
      input-overlay # show keyboard/gamepad/mouse input
      advanced-scene-switcher # automated scene switcher
      obs-source-switcher # switch between list of sources
      obs-replay-source # replay a source
      obs-source-clone # be able to clone sources
      obs-mute-filter # mute audio of a source

      # effects
      obs-move-transition # move source to new position during scene transition
      obs-3d-effect # add 3d effects (can be animated too with move-transition, including other filters)
      obs-composite-blur # add blur to sources
      obs-shaderfilter # add shaders to sources
      obs-rgb-levels-filter # filter for adjusting rgb levels
      obs-gradient-source # adds gradient colors to objects
      obs-backgroundremoval # replace background in image/video
      obs-scale-to-sound # scales source reactively to sound levels
      obs-freeze-filter # freeze source as filter
      obs-text-pthread # useful text source plugin
    ];
  };
}
