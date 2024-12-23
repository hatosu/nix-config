{ pkgs, ...}: { home-manager.users.hatosu.programs.tmux = {

  package = pkgs.tmux;

  enable = true;
  aggressiveResize = false;
  clock24 = false;
  customPaneNavigationAndResize = false;
  disableConfirmationPrompt = false;
  focusEvents = false;
  mouse = false;
  newSession = false;
  tmuxinator.enable = false;
  tmuxp.enable = false;
  reverseSplit = false;
  secureSocket = true;
  sensibleOnTop = false;

  baseIndex = 0;
  escapeTime = 500;
  historyLimit = 5000;
  resizeAmount = 5;

  prefix = "C-a";
  shell = "\${pkgs.zsh}/bin/zsh";
  shortcut = "b";
  terminal = "screen-256color";
  keyMode = "vi";

  plugins = with pkgs; [
    
    tmuxPlugins.cpu
    
    {
      plugin = tmuxPlugins.resurrect;
      extraConfig = "set -g @resurrect-strategy-nvim 'session'";
    }
    
    {
      plugin = tmuxPlugins.continuum;
      extraConfig = ''
        set -g @continuum-restore 'on'
        set -g @continuum-save-interval '60' # minutes
      '';
    }
  
  ];

  extraConfig = ''
  '';

};}
