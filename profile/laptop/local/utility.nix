{ pkgs
, config
, inputs
, ...
}: {
  # bat
  home-manager.users.hatosu.programs.bat = {
    package = pkgs.bat;
    enable = true;
    config = {
      theme = "base16";
    };
  };
}
