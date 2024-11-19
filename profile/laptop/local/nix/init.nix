{ ... }: { environment = { interactiveShellInit = ''

  USER="$(whoami)"
  cd "$HOME/X"

'';};}
