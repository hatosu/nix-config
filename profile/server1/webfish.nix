{ pkgs, ... }: {

  environment.systemPackages = let 
  webfish-idle = pkgs.writeShellScriptBin "webfish-idle" ''
    echo Hello World
  ''; in [ webfish-idle ];

}
