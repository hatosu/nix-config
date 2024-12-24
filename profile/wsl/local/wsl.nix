{ ... }: {

  wsl = {
    enable = true;
    defaultUser = "hatosu";
  };

  environment.interactiveShellInit = ''
    cd /mnt/c/Users/hatosu/files
    cd(){
      if [ $# -eq 0 ]; then
        builtin cd /mnt/c/Users/hatosu/files
      else
        builtin cd "$@"
      fi
    }
  '';

}
