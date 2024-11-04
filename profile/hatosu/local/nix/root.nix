{ ... }: {

  # declare machine-id (prevents impermanence errors)
  environment.etc.machine-id = { text = "a18b549c5915442693cd012bb398da2f"; enable = true; };

}
