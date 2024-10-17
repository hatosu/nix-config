{pkgs,...}:let rebuild=pkgs.writeShellScriptBin"rebuild"''

# give more room to see errors
clear

# backup files
sudo rm -r /persist/nixos
sudo rm -r /persist/X
sudo cp -r /home/hatosu/X /persist
sudo cp -r /etc/nixos /persist

# rebuild system
sudo nixos-rebuild switch --flake /etc/nixos#desktop
${pkgs.noti}/bin/noti -t 'REBUILD' -m 'system successfully rebuilt according to your personal nix configuration files >:3'

# prepare for run once commands
LOCK_FILE="/home/hatosu/X/.run_once_lock"
if [ -f "$LOCK_FILE" ]; then
  exit 0
fi

# put run once commands here
sudo waydroid init

# finish up
sudo touch "$LOCK_FILE"
${pkgs.noti}/bin/noti -t 'RUNONCE' -m 'finished executing run-once commands'

'';in{environment.systemPackages=[rebuild];}
