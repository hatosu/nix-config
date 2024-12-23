{ ... }: {

  wsl = {
    enable = true;
    defaultUser = "hatosu";
  };

  environment.interactiveShellInit = ''
    cd /mnt/c/Users/hatosu
    cd(){
      if [ $# -eq 0 ]; then
        builtin cd /mnt/c/Users/hatosu
      else
        builtin cd "$@"
      fi
    }
  '';

}
