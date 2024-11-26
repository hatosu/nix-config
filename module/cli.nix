{ pkgs, lib, ... }:
{

  # wayland terminal
  home-manager.users.hatosu.programs.foot = {
    enable = true;
    package = pkgs.foot;
    settings = {
      main = {
        font = "gohufont:size=12";
      };
      mouse = {
        hide-when-typing = "yes";
      };
      colors = {
        background = "1C1C1C";
        foreground = "e0def4";
        regular0 = "26233a";
        regular1 = "eb6f92";
        regular2 = "31748f";
        regular3 = "f6c177";
        regular4 = "9ccfd8";
        regular5 = "c4a7e7";
        regular6 = "ebbcba";
        regular7 = "e0def4";
        bright0 = "6e6a86";
        bright1 = "eb6f92";
        bright2 = "31748f";
        bright3 = "f6c177";
        bright4 = "9ccfd8";
        bright5 = "c4a7e7";
        bright6 = "ebbcba";
        bright7 = "e0def4";
      };
    };
  };

  # xorg terminal
  home-manager.users.hatosu.programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    themeFile = "Pnevma";
  };

  # custom prompt
  home-manager.users.hatosu.programs.starship = {
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
        success_symbol = " 󱄅 ";
        error_symbol = " 󱄅 ";
      };
      directory = {
        read_only = " ";
        home_symbol = "~";
      };
    };
  };

  home-manager.users.hatosu.programs.zsh = {

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
        "ls"
        "ls -a"
        "c"
        "e"
        "p"
        "s"
        "b"
      ];
    };

  };

  # set zsh as default shell
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # zoxide for "z" command
  home-manager.users.hatosu.programs.zoxide = {
    enable = true;
    package = pkgs.zoxide;
    enableZshIntegration = true;
  };

}
