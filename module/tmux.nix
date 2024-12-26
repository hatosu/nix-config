{ pkgs, ... }: let

  EDITOR = "nvim";

  DIR = "/mnt/c/Users/hatosu/files/";

  INIT = pkgs.writeShellScriptBin "tmux_init" ''
    S="my_tmux_session"
    tmux has-session -t $S 2>/dev/null
    if [ $? != 0 ]; then
      tmux new-session -d -s $S -n "editor"
      tmux send-keys -t $S:editor "cd ${DIR}" C-m
      tmux send-keys -t $S:editor "${EDITOR} ." C-m
      tmux new-window -t $S -n "terminal"
      tmux send-keys -t $S:terminal "echo 'guh... mlem...' | ${pkgs.lolcat}/bin/lolcat"
      #tmux new-window -t $S -n "logs"
      #tmux send-keys -t $S:logs "tail -f ~/insert/dir/to/log/file"
    fi
  '';

in {

  home-manager.users.hatosu = { 

    programs.tmux = {

      keyMode = if let x = [ "vi" "vim" "nvim" ]; in builtins.elem EDITOR x then "vi" else "emacs";

      prefix = "C-b";
      shell = "\${pkgs.zsh}/bin/zsh";
      shortcut = "b";
      terminal = "screen-256color";

      baseIndex = 0;
      escapeTime = 500;
      historyLimit = 5000;
      resizeAmount = 5;

      extraConfig = ''
         set -g pane-border-style fg='#6272a4'
         set -g pane-active-border-style fg='#ff79c6'
         set -g message-style bg='#44475a',fg='#8be9fd'
         set -g status-style bg='#44475a',fg='#bd93f9'
         set -g status-interval 1
         set -g status-left '#[bg=#f8f8f2]#[fg=#282a36]#{?client_prefix,#[bg=#ff79c6],} ☺ '
         set -ga status-left '#[bg=#44475a]#[fg=#ff79c6] #{?window_zoomed_flag, ↕  ,   }'
         set -g window-status-current-format "#[fg=#44475a]#[bg=#bd93f9]#[fg=#f8f8f2]#[bg=#bd93f9] #I #W #[fg=#bd93f9]#[bg=#44475a]"
         set -g window-status-format "#[fg=#f8f8f2]#[bg=#44475a]#I #W #[fg=#44475a] "
         set -g status-right '#[fg=#8be9fd,bg=#44475a]#[fg=#44475a,bg=#8be9fd] #(tmux-mem-cpu-load -g 5 --interval 2) '
         set -ga status-right '#[fg=#ff79c6,bg=#8be9fd]#[fg=#44475a,bg=#ff79c6] #(uptime | cut -f 4-5 -d " " | cut -f 1 -d ",") '
         set -ga status-right '#[fg=#bd93f9,bg=#ff79c6]#[fg=#f8f8f2,bg=#bd93f9] %a %H:%M:%S #[fg=#6272a4]%Y-%m-%d '
       '';

      plugins = with pkgs; [
        
        tmuxPlugins.cpu
        
        {
          plugin = tmuxPlugins.resurrect;
          extraConfig = "set -g @resurrect-strategy-nvim 'session'";
        }
        
        {
          plugin = tmuxPlugins.continuum;
          extraConfig = ''
            set -g @resurrect-strategy-nvim 'session'
            set -g @resurrect-capture-pane-contents 'on'
            set -g @continuum-restore 'on'
            set -g @continuum-save-interval '60' # minutes
          '';
        }
      
      ];
  
      enable = true;
      package = pkgs.tmux;
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
    
};home.packages=[INIT];};}
