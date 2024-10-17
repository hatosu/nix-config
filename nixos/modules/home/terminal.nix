{pkgs,lib,...}:{

  # setup terminal emulator
  programs.foot = {
    enable = true;
    package = pkgs.foot;
    settings = {
      main = {
        font = "gohufont:size=12";
      };
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };

  # custom prompt
  programs.starship = { 
    package = pkgs.starship;
    enable = true;
    enableZshIntegration = true;
    enableTransience = true;
    settings = {
      add_newline = true;
      format = lib.concatStrings [
        "$all"
        "$line_break"
        "$character"
        "$directory"
      ];
      scan_timeout = 10;
      character = {
        success_symbol = "  ";
        error_symbol = "  ";
      };
      directory = {
        read_only = " ";
        home_symbol = "~";
      };
    };
  };

  programs.zsh = {

    # enable zsh and some default plugins
    package = pkgs.zsh;
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # ohmyzsh plugins
    oh-my-zsh = {
      package = pkgs.oh-my-zsh;
      enable = true;
      plugins = [
        "git"
      ];
    };

    # manage history
    history = {
      size = 10000;
      ignoreAllDups = true;
      path = "$HOME/.zsh_history";
      ignorePatterns = [
        "rebuild"
        "pkill *"
        "clear"
        "exit"
        "c"
        "e"
        "p"
        "s"
        "b"
      ];
    };

  };

  # zoxide for "z" command
  programs.zoxide = {
    enable = true;
    package = pkgs.zoxide;
    enableZshIntegration = true;
  };

}
